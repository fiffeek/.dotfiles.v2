#!/usr/bin/env bash

set -x
set -euo pipefail

# Defaults
THEME_JSON=""
GUI_JSON_DEFAULT_LINUX="$HOME/.config/calibre/gui.json"
GUI_JSON="${GUI_JSON_DEFAULT_LINUX}"

usage() {
  cat <<EOF
Usage: $(basename "$0") --theme /path/to/theme.json [--gui /path/to/gui.json]

- --theme      Path to your Matugen JSON (with .light.palette and .dark.palette)
- --gui        Path to Calibre gui.json (default:
               Linux: ${GUI_JSON_DEFAULT_LINUX})

Examples:
  $(basename "$0") --theme ./matugen_calibre.json
  $(basename "$0") --theme ./matugen_calibre.json --gui ~/.config/calibre/gui.json
EOF
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
  --theme)
    THEME_JSON="${2:-}"
    shift 2
    ;;
  --gui)
    GUI_JSON="${2:-}"
    shift 2
    ;;
  -h | --help)
    usage
    ;;
  *)
    echo "Unknown argument: $1"
    usage
    ;;
  esac
done

[[ -z "$THEME_JSON" ]] && {
  echo "Error: --theme is required."
  usage
}
[[ ! -f "$THEME_JSON" ]] && {
  echo "Error: theme file not found: $THEME_JSON"
  exit 1
}

CALIBRE_RUNNING=false
if pgrep -f "bin/calibre" >/dev/null 2>&1; then
  CALIBRE_RUNNING=true
  echo "Calibre is running → killing it first..."
  pkill -f "calibre/bin"
  sleep 2
fi

# Validate the theme JSON has the expected structure
if ! jq -e '.light.palette and .dark.palette' "$THEME_JSON" >/dev/null 2>&1; then
  echo "Error: theme JSON must contain .light.palette and .dark.palette objects."
  exit 1
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP="${GUI_JSON%.json}.backup-${STAMP}.json"
THEME_JSON_CONTENT="$(cat "$THEME_JSON")"
GUI_JSON_CONTENT="$(cat "$GUI_JSON")"

TMP="$(mktemp)"
jq -n \
  --argjson gui "$GUI_JSON_CONTENT" \
  --argjson theme "$THEME_JSON_CONTENT" '
    def ensure(obj): if obj then obj else {} end;

    $gui
    | .light_palettes = ensure(.light_palettes)
    | .dark_palettes  = ensure(.dark_palettes)
    # write named palette "Matugen"
    | .light_palettes.Matugen = $theme.light.palette
    | .dark_palettes.Matugen  = $theme.dark.palette
    # also refresh __current__ to match Matugen
    | .light_palettes.__current__ = $theme.light.palette
    | .dark_palettes.__current__  = $theme.dark.palette
    # force Calibre to pick them
    | .light_palette_name = "Matugen"
    | .dark_palette_name  = "Matugen"
  ' >"$TMP"

mv "$TMP" "$GUI_JSON"

echo "Updated: $GUI_JSON"
echo "✔ light_palettes.__current__ and dark_palettes.__current__ replaced from $THEME_JSON"

if [[ "$CALIBRE_RUNNING" == true ]]; then
  echo "🔄 Restarting Calibre..."
  nohup calibre >/dev/null 2>&1 &
fi

#!/bin/bash

set -o pipefail
set -eux

TARGET="${2:-""}"
EXTRA_ARGS="${*:3}"
CACHE_DIR="$XDG_CACHE_HOME"/matugen/options
CACHE_FILE="$CACHE_DIR"/"$(cksum <<<"$TARGET" | cut -f 1 -d ' ')"
MATUGEN_CS_CACHE="$XDG_CACHE_HOME/matugen/current_colorscheme"
MATUGEN_OPTIONS_CACHE="$XDG_CACHE_HOME/matugen/options/last_applied"

mkdir -p "$CACHE_DIR"

function matugen_run {
  local action paper extra
  action="$1"
  paper="$2"
  extra="$3"

  if [ -n "$extra" ]; then
    touch "$CACHE_FILE"
    echo "$extra" >>"$CACHE_FILE"
  fi

  if [ -f "$CACHE_FILE" ]; then
    extra="$(tail -n 1 "$CACHE_FILE")"
  fi

  echo "$extra" >"$MATUGEN_OPTIONS_CACHE"
  matugen $extra $action "$paper"
}

case "$1" in
image)
  rm "$MATUGEN_CS_CACHE" || true
  matugen_run "image" "$TARGET" "$EXTRA_ARGS"
  ;;
hex)
  echo "$TARGET" >"$MATUGEN_CS_CACHE"
  matugen_run "color hex" "$TARGET" "$EXTRA_ARGS"
  ;;
revert)
  sed -i '$ d' "$CACHE_FILE"
  matugen_run "image" "$TARGET" ""
  ;;
removecache)
  rm "$CACHE_FILE"
  ;;
*)
  echo "operation required"
  exit 1
  ;;
esac

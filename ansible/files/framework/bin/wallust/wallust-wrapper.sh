#!/bin/bash

set -e

TARGET="$2"
EXTRA_ARGS="${*:3}"
CACHE_DIR="$XDG_CACHE_HOME"/wallust/options
CACHE_FILE="$CACHE_DIR"/"$(cksum <<<"$TARGET" | cut -f 1 -d ' ')"
WALLUST_CS_CACHE="$XDG_CACHE_HOME/wallust/current_colorscheme"
WALLUST_OPTIONS_CACHE="$XDG_CACHE_HOME/wallust/options/last_applied"

mkdir -p "$CACHE_DIR"

function wallust_run {
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

  echo "$extra" >"$WALLUST_OPTIONS_CACHE"
  wallust $action "$paper" --skip-sequences $extra
}

case "$1" in
run)
  rm "$WALLUST_CS_CACHE" || true
  wallust_run "run" "$TARGET" "$EXTRA_ARGS"
  ;;
colorscheme)
  echo "$TARGET" >"$WALLUST_CS_CACHE"
  wallust_run "cs" "$TARGET" "$EXTRA_ARGS"
  ;;
revert)
  sed -i '$ d' "$CACHE_FILE"
  wallust_run "run" "$TARGET" ""
  ;;
removecache)
  rm "$CACHE_FILE"
  ;;
*)
  echo "operation required"
  exit 1
  ;;
esac

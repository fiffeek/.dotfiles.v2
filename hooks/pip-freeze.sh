#!/bin/bash

DIR="$(dirname "$(realpath "$0")")"

source "$DIR/../venv/bin/activate"

TMP_FILE="$(mktemp)"
REQUIREMENTS_FILE="requirements.txt"

pip freeze | sed 's/_/-/g' |
  awk -F '==' '{ printf "%s==%s\n", tolower($1), $2 }' \
    >"$TMP_FILE"

if ! cmp -s "$TMP_FILE" "$REQUIREMENTS_FILE"; then
  mv "$TMP_FILE" "$REQUIREMENTS_FILE"
else
  rm "$TMP_FILE"
fi

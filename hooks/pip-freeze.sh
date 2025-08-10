#!/bin/bash

DIR="$(dirname "$(realpath "$0")")"

source "$DIR/../venv/bin/activate"

pip freeze | sed 's/_/-/g' |
  awk -F '==' '{ printf "%s==%s\n", tolower($1), $2 }' \
    >requirements.txt

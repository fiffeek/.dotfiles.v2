#!/bin/bash

set -e

DIR="$(dirname "$(realpath "$0")")"

source "$DIR/../venv/bin/activate"

dirs=("ansible")
errors=()

for dir in "${dirs[@]}"; do
  echo "Running ansible-lint in $dir..."
  if ! (cd "$dir" && ansible-lint --fix --offline); then
    errors+=("$dir")
  fi
done

if [ "${#errors[@]}" -ne 0 ]; then
  echo -e "\n❌ Ansible-lint failed in the following directories:"
  for err in "${errors[@]}"; do
    echo "  - $err"
  done
  exit 1
else
  echo -e "\n✅ All ansible-lint checks passed!"
fi

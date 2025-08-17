#!/usr/bin/env python3
from pathlib import Path
import sys

for f in sys.argv[1:]:
    lines = Path(f).read_text().splitlines()
    out_lines = []

    for line in lines:
        stripped = line.strip()

        if not stripped or stripped.startswith("#"):
            out_lines.append(line.rstrip())
            continue

        if stripped.startswith("[") and stripped.endswith("]"):
            out_lines.append(stripped)
            continue

        if "=" in stripped:
            key, value = stripped.split("=", 1)
            out_lines.append(f"{key.strip()}={value.strip()}")
        else:
            out_lines.append(stripped)

    Path(f).write_text("\n".join(out_lines) + "\n")

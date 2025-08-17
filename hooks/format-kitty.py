#!/usr/bin/env python3
from pathlib import Path
import sys

for f in sys.argv[1:]:
    lines = Path(f).read_text().splitlines()

    # Find max key length for alignment
    max_key_len = 0
    for line in lines:
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        key, *_ = line.strip().split(None, 1)
        max_key_len = max(max_key_len, len(key))

    out_lines = []
    for line in lines:
        if not line.strip() or line.lstrip().startswith("#"):
            out_lines.append(line.rstrip())
        else:
            parts = line.strip().split(None, 1)
            key = parts[0]
            value = parts[1] if len(parts) > 1 else ""
            out_lines.append(f"{key.ljust(max_key_len)} {value}".rstrip())

    Path(f).write_text("\n".join(out_lines) + "\n")

# Wallust → btop template

# Leave empty to keep terminal transparency
theme[main_bg]=""

# Main text
theme[main_fg]="{{foreground}}"

# Titles & accents
theme[title]="{{color4}}"
theme[hi_fg]="{{color6}}"

# Selection
theme[selected_bg]="{{color4}}"
theme[selected_fg]="{{background}}"

# Inactive / subtle text
theme[inactive_fg]="{{color8}}"

# Misc in process box
theme[proc_misc]="{{color5}}"

# Box outlines
theme[cpu_box]="{{color8}}"
theme[mem_box]="{{color8}}"
theme[net_box]="{{color8}}"
theme[proc_box]="{{color8}}"

# Dividers / small box borders
theme[div_line]="{{color7}}"

# --- Gradients ---

# Temperature
theme[temp_start]="{{color6}}"
theme[temp_mid]="{{color4}}"
theme[temp_end]="{{color1}}"

# CPU
theme[cpu_start]="{{color6}}"
theme[cpu_mid]="{{color4}}"
theme[cpu_end]="{{color1}}"

# Mem/Disk: free
theme[free_start]="{{color6}}"
theme[free_mid]=""
theme[free_end]="{{color14}}"

# Mem/Disk: cached
theme[cached_start]="{{color5}}"
theme[cached_mid]=""
theme[cached_end]="{{color13}}"

# Mem/Disk: available
theme[available_start]="{{color4}}"
theme[available_mid]=""
theme[available_end]="{{color12}}"

# Mem/Disk: used
theme[used_start]="{{color1}}"
theme[used_mid]=""
theme[used_end]="{{color9}}"

# Network
theme[download_start]="{{color6}}"
theme[download_mid]="{{color4}}"
theme[download_end]="{{color5}}"

theme[upload_start]="{{color6}}"
theme[upload_mid]="{{color4}}"
theme[upload_end]="{{color5}}"

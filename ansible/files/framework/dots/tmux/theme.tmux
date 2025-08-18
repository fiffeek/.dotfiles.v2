#!/usr/bin/env bash

set -g mode-style "fg=#{@tmux_primary},bg=#{@matugen_surface_container_high}"

set -g message-style "fg=#{@matugen_primary},bg=#{@matugen_surface_container_high}"
set -g message-command-style "fg=#{@matugen_primary},bg=#{@matugen_surface_container_high}"

set -g pane-border-style "fg=#{@matugen_surface_container_high}"
set -g pane-active-border-style "fg=#{@matugen_primary}"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#{@matugen_primary},bg=#{@matugen_surface}"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#{@matugen_surface},bg=#{@matugen_primary},bold] #S #[fg=#{@matugen_primary},bg=#{@matugen_surface},nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#{@matugen_surface},bg=#{@matugen_surface},nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=#{@matugen_surface}] #{prefix_highlight} #[fg=#{@matugen_surface_container_high},bg=#{@matugen_surface},nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=#{@matugen_surface_container_high}] %Y-%m-%d  %I:%M %p #[fg=#{@matugen_primary},bg=#{@matugen_surface_container_high},nobold,nounderscore,noitalics]#[fg=#{@matugen_surface},bg=#{@matugen_primary},bold] #h "

setw -g window-status-activity-style "underscore,fg=#{@matugen_on_surface},bg=#{@matugen_surface}"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#{@matugen_on_surface},bg=#{@matugen_surface}"
setw -g window-status-format "#[fg=#{@matugen_surface},bg=#{@matugen_surface},nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#{@matugen_surface},bg=#{@matugen_surface},nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#{@matugen_surface},bg=#{@matugen_surface_container_high},nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=#{@matugen_surface_container_high},bold] #I  #W #F #[fg=#{@matugen_surface_container_high},bg=#{@matugen_surface},nobold,nounderscore,noitalics]"

set -g @prefix_highlight_output_prefix "#[fg=#{@matugen_secondary}]#[bg=#{@matugen_surface}]#[fg=#{@matugen_surface}]#[bg=#{@matugen_secondary}]"
set -g @prefix_highlight_output_suffix ""

set -g status-bg default

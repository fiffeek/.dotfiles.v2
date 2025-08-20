#!/usr/bin/env bash

setw -g mode-style "bg=#{@matugen_inverse_surface},fg=#{@matugen_inverse_on_surface}"

set -g message-style "fg=#{@matugen_primary},bg=default"
set -g message-command-style "fg=#{@matugen_primary},bg=default"

set -g pane-border-style "fg=default"
set -g pane-active-border-style "fg=#{@matugen_primary}"

set -g status "on"
set -g status-justify "left"
set -g status-style "fg=default,bg=default"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#{@matugen_surface},bg=#{@matugen_primary},bold] #S #[fg=#{@matugen_primary},bg=default,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#{@matugen_surface},bg=default,nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=default] #{prefix_highlight} #[fg=default,bg=default,nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=default] %Y-%m-%d  %I:%M %p #[fg=#{@matugen_primary},bg=default,nobold,nounderscore,noitalics]#[fg=#{@matugen_surface},bg=#{@matugen_primary},bold] #h "

setw -g window-status-activity-style "underscore,fg=default,bg=default"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=default,bg=default"
setw -g window-status-format "#[fg=default,bg=default,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#{@matugen_surface},bg=default,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=default,bg=default,nobold,nounderscore,noitalics]#[fg=#{@matugen_primary},bg=default,bold] #I  #W #F #[fg=default,bg=default,nobold,nounderscore,noitalics]"

set -g @prefix_highlight_output_prefix "#[fg=#{@matugen_secondary}]#[bg=default]#[fg=#{@matugen_surface}]#[bg=#{@matugen_secondary}]"
set -g @prefix_highlight_output_suffix ""

set -g status-bg default

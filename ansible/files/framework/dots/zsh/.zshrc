# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# tmuxp
export DISABLE_AUTO_TITLE='true'

export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
# Add custom binaries to the path
export PATH=$HOME/.bin:$HOME/.bin/bin:$PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export LD_LIBRARY_PATH=$HOME/.bin/lib:$LD_LIBRARY_PATH
export PATH=$HOME/.spicetify:$PATH

export FZF_PATH=$HOME

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# FZF
export FZF_PREVIEW_WINDOW='right:50%:nohidden'

# Lesspipe
(which lesspipe 1>/dev/null 2>&1 && eval "$(lesspipe)") || (which lesspipe.sh 1>/dev/null 2>&1 && export LESSOPEN="|lesspipe.sh %s")

# fzf configure
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  zsh-syntax-highlighting
  sudo
  copyfile
  fzf-zsh-plugin
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autocompletions
bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Tmux
export EDITOR='nvim'

# EXA aliases

# general use
alias ls='exa'                                                         # ls
alias l='exa -lbF'                                                     # list, size, type, git
alias ll='exa -lbGF'                                                   # long list
alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# speciality views
alias lS='exa -1'			                                                  # one column, just names
alias lt='exa --tree --level=2'                                         # tree
alias tree='exa --tree'

# Bluetooth ON/OFF with restart due to TLP interfering after the startup
alias bon="rfkill block bluetooth && rfkill unblock bluetooth && bluetoothctl power on"
alias boff="bluetoothctl power off"


# VIM == NVIM
alias vim=nvim
# Well, this seems to be a common mistake!
alias neovim=nvim
alias n=nvim

# Options
setopt AUTO_CD # instead of 'cd folder' if you could just type 'folder'

# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt INTERACTIVE_COMMENTS        # pound sign in interactive prompt
HISTFILE=~/.zsh_history            # where to save zsh history
HISTSIZE=10000
SAVEHIST=10000

# Presenter mode
alias presenter_mode_on="alacritty msg config -w -1 font.size=18"
alias presenter_mode_off="alacritty msg config -w -1 --reset"

export MANPAGER='nvim +Man!'
export MANWIDTH=999

# FZF advanced preview
export FZF_PREVIEW_ADVANCED=true

# pnpm
export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zoxide
eval "$(zoxide init zsh)"

typeset -f enable-fzf-tab >/dev/null && enable-fzf-tab

function headphones() {
  bon
  bluetoothctl connect AC:80:0A:EA:C8:66
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fmikina/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fmikina/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/fmikina/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fmikina/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/fmikina/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/fmikina/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


unsetopt BEEP

alias power_mode_normal="powerprofilesctl set balanced && sudo cpupower frequency-set -g powersave"
alias power_mode_boost="powerprofilesctl set performance && sudo cpupower frequency-set -g performance"

alias dhcp_lest="sudo dhcpcd -T $(ip route get 1.1.1.1 | cut -f5 -d' ' | head -n1)"

alias p="pre-commit"
alias v="souce venv/bin/activate"

# vpn
alias mdd="mullvad disconnect"
alias mdc="mullvad connect"

alias keepify="find . -type d -exec touch {}/.gitkeep \\;"

alias pow="sudo powertop"

alias h="hyprctl"
alias H="hyprland"

bindkey -v

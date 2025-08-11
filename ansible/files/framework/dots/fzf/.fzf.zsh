# Setup fzf
# ---------
if [[ ! "$PATH" == *${FZF_PATH}/bin* ]]; then
  export PATH="$PATH:${FZF_PATH}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.zsh"

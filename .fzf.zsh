# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rais/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/rais/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rais/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/rais/.fzf/shell/key-bindings.zsh"

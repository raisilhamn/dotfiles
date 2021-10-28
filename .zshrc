if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
unsetopt correct_all
# Use powerline
USE_POWERLINE="true"

# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
eval "$(navi widget zsh)"

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U compinit && compinit -u

## ==========  alias
alias ls="exa --icons --group-directories-first"
alias du="dust"
alias top="ytop"
alias band="sudo bandwhich"
#alias paru="yay"
alias icat="kitty +kitten icat"
alias neofetch="neofetch --kitty /home/rais/Pictures/foto.png --size 500"
alias packagesize="expac -H M '%m\t%n' | sort -h"
alias c="clear"
alias cat="bat"
alias j="z"
alias rr="ranger"
alias wtr="curl wttr.in/~Bantul"
alias storage="ncdu"
# ctf-tools: PATH setup
# export PATH=/home/rais/Downloads/github/ctf-tools/bin:$PATH
alias yt="ytfzf -t"
alias dut="dutree"
alias orphan-packages="sudo aura -Oj"
alias gf="git fuzzy"
alias save-state="sudo aura -B"
export PATH="/home/rais/Downloads/code/git-fuzzy/bin:$PATH"
alias up="cd ../"
alias ds="dua i"
alias nn="nnn"
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


# ========== Zgen
# source "${HOME}/.zgen/zgen.zsh"
# zgen load "MichaelAquilina/zsh-you-should-use"
# zgen load "skywind3000/z.lua"
# zgen load "kazhala/dotbare"
# zgen load "Aloxaf/fzf-tab"
# zgen load "Bhupesh-V/ugit"
# zgen load "bigH/git-fuzzy"
# zgen load "zdharma/fast-syntax-highlighting"
# zgen load "zsh-users/zsh-completions"
# zgen load "zsh-users/zsh-autosuggestions"
# zgen load "zsh-users/zsh-completions"
# zgen load "SleepyBag/fuzzy-fs"
# zgen load "unixorn/autoupdate-zgen"

# ========== Zplug
# source ~/.zplug/init.zsh

# zplug "MichaelAquilina/zsh-you-should-use"
# zplug "skywind3000/z.lua"
# # zplug load "kazhala/dotbare"
# zplug "Aloxaf/fzf-tab"
# zplug "Bhupesh-V/ugit"
# zplug "bigH/git-fuzzy"
# zplug "zdharma/fast-syntax-highlighting"
# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# zplug "SleepyBag/fuzzy-fs"
# zplug load

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# ========== Zinit
# zinit wait lucid light-mode for \
#   atinit"zicompinit; zicdreplay" \
#       zdharma/fast-syntax-highlighting \
#   atload"_zsh_autosuggest_start" \
#       zsh-users/zsh-autosuggestions \
#   blockf atpull'zinit creinstall -q .' \
#       zsh-users/zsh-completions

zinit light MichaelAquilina/zsh-you-should-use
zinit light skywind3000/z.lua
zinit light Aloxaf/fzf-tab
# zinit light Bhupesh-V/ugit
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions


# zinit light bigH/git-fuzzy

# zinit ice lucid nocompile
# zinit light MenkeTechnologies/zsh-cargo-completion


# ========== speed test zsh 
source ~/zsh-prompt-benchmark/zsh-prompt-benchmark.plugin.zsh

# ========== fun
fastfetch --logo arch --packages-format "{} (pacman)" --separator " → " --os-format "Arch Linux ({12})" --structure "Title:Separator:OS:Host:Uptime:Packages:Shell:Resolution:DE:WM:WMTheme:Terminal:CPU:GPU:Battery:Memory:Disk"

# macchina -c green --no-box --no-ascii --no-separator --no-bar-delimiter --short-uptime -H LocalIP
# colorscript -e panes
# fastfetch --logo arch --os-format "Arch Linux ({12})" --packages-format "{} (pacman)" --kernel-format "{0}" --locale-format "{0}" --cursor-format "{0}" --icons-format "{0}" --theme-format "{0}"
# colorscript -e spectrum
# colorscript -e elfman
# colorscript -e crunchbang-mini
# colorscript -r 

# ========= FZF color
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

# ========= FZF common setup
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
FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS


fastfetch --logo arch --packages-format "{} (pacman)" --separator " → " --os-format "Arch Linux ({12})"  --structure "Title:Separator:OS:Host:Uptime:Packages:Shell:Resolution:DE:Board:Bios:Terminal:CPU:GPU:Battery:Memory:Break:Colors:Break" 

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

unsetopt correct_all

USE_POWERLINE="false"



[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ========== speed test zsh 
# source ~/zsh-prompt-benchmark.plugin.zsh


source ~/powerlevel10k/powerlevel10k.zsh-theme

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light Aloxaf/fzf-tab

# ========== fun
# fastfetch --logo arch --os-format "Arch Linux ({12})" --packages-format "{} (pacman)" --kernel-format "{0}" --locale-format "{0}" --cursor-format "{0}" --icons-format "{0}" --theme-format "{0}"
# colorscript random

# ========= FZF color
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

# # ========= FZF Tab common setup
# # disable sort when completing `git checkout`
# zstyle ':completion:*:git-checkout:*' sort false
# # set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# # set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# # preview directory's content with exa when completing cd
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# # switch group using `,` and `.`
# zstyle ':fzf-tab:*' switch-group ',' '.'
# FZF_TAB_GROUP_COLORS=(
#     $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
#     $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
#     $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
# )
# zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS

# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
# export LESSOPEN='|~/.lessfilter %s'

# zstyle ':fzf-tab:complete:*:options' fzf-preview 
# zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'



# zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'
# # it is an example. you can change it
# zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
# 	'git diff $word | delta'
# zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
# 	'git log --color=always $word'
# zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
# 	'git help $word | bat -plman --color=always'
# zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
# 	'case "$group" in
# 	"commit tag") git show --color=always $word ;;
# 	*) git show --color=always $word | delta ;;
# 	esac'
# zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
# 	'case "$group" in
# 	"modified file") git diff $word | delta ;;
# 	"recent commit object name") git show --color=always $word | delta ;;
# 	*) git log --color=always $word ;;
# 	esac'

# zstyle '*:compinit' arguments -D -i -u -C -w
# # all Tab widgets
# zstyle ':autocomplete:*complete*:*' insert-unambiguous yes

# # all history widgets
# zstyle ':autocomplete:*history*:*' insert-unambiguous yes

# # ^S
# zstyle ':autocomplete:menu-search:*' insert-unambiguous yes


zinit light Freed-Wu/fzf-tab-source

# pnpm
export PNPM_HOME="/home/rais/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# ENV VARIABLE      #
#####################
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true     # make pasting into terminal faster

zinit snippet OMZL::git.zsh
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::termsupport.zsh


# ==========  alias
alias ls="exa --icons --group-directories-first"
alias npmnuke="echo Deleting ^/node_modules/ && rm -rf ./**/node_modules"
alias zzz="systemctl suspend"
alias myip='curl ipinfo.io/ip'  # Public IP
alias untar='tar -zxvf'
alias yt2mp3='yt-dlp -x --audio-format mp3 --audio-quality 0 --add-metadata'
alias du="dust"
alias top="ytop"
alias band="sudo bandwhich"
#alias paru="yay"
alias icat="kitty +kitten icat"
alias neofetch="neofetch --kitty /home/rais/Pictures/foto.png --size 500"
alias packagesize="expac -H M '%m\t%n' | sort -h"
# alias c="clear"
alias c="printf '\033[2J\033[3J\033[1;1H'"
alias cat="bat"
alias j="z"
alias jh='z -I -t .'
alias rr="ranger"
alias wtr="curl wttr.in/~Bantul"
# alias storage="ncdu"
# alias yt="ytfzf -t"
alias yt="yt-dlp"
alias dut="dutree"
alias orphan-packages="sudo aura -Oj"
alias gf="git fuzzy"
alias save-state="sudo aura -B"
alias up="cd ../"
alias storage="dua i"
alias nn="nnn"
alias remove_last="sudo paccache -rk 1"
alias E="exit"
alias yg='you-get'
# alias zh='z -I -t .'
alias uall='sudo pacman -Sy && sudo powerpill -Su && paru -Su'

alias dw='dwall -s colony'
alias update-mirror='sudo pacman-mirrors --fasttrack && sudo pacman -Syyu'
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
alias update-gallerydl='python3 -m pip install -U gallery-dl'
alias lz='lazydocker'
alias mcr='micro'
alias codev='vscodium'
alias sc='scrcpy'
alias tmail='tmpmail --generate'
alias qw='onboard'
alias rall="paccache -rk0"

# ========== Zinit
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# zinit light zdharma/fast-syntax-highlighting
# zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions

zinit wait lucid for \
	OMZL::clipboard.zsh \
	OMZL::compfix.zsh \
	OMZL::completion.zsh \
	OMZL::correction.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
	OMZL::directories.zsh \
	OMZL::git.zsh \
	OMZL::grep.zsh \
	OMZL::history.zsh \
	OMZL::key-bindings.zsh \
	OMZL::spectrum.zsh \
	OMZL::termsupport.zsh \
    atload"
        alias gcd='gco dev'
    " \
	OMZP::git \
    atload"
        alias dcupb='docker-compose up --build'
    " \
    djui/alias-tips \
    # hlissner/zsh-autopair \
    # chriskempson/base16-shell \


zinit ice depth=1
zinit light MichaelAquilina/zsh-you-should-use

zinit ice depth=1
zinit light skywind3000/z.lua


zinit ice depth=1

# 
# source "$HOME/.zinit/bin/zinit.zsh"
# zinit ice lucid nocompile wait'0e' nocompletions
# zinit load MenkeTechnologies/zsh-more-completions
# thefuck
zinit ice wait"1" lucid
zinit light laggardkernel/zsh-thefuck

# better-npm
zinit ice wait"1" lucid
zinit light lukechilds/zsh-better-npm-completion

zinit ice wait"1" lucid
zinit light MichaelAquilina/zsh-auto-notify

# git-extras
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras

zinit ice depth=1; zinit light romkatv/powerlevel10k


# zinit load z-shell/H-S-MW

# autoload -U compinit; compinit
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"

# bun completions
[ -s "/home/rais/.bun/_bun" ] && source "/home/rais/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export OLLAMA_MODELS=/mnt/BE728CFC728CBAA3/ollama/ ollama serve
# source /home/rais/.local/share/zinit/plugins/tj---git-extras/etc/git-extras-completion.zsh

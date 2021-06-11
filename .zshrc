#Pfetch config
export PF_SEP=":"
export PF_COL1=4
export PF_COL2=4
export PF_COL3=2
export PF_ALIGN="8"

#/home/k0ss4/.pfetch/./pfetch
colorscript -r
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### Exports ###
export PATH="${PATH}:/home/k0ss4/.local/bin"
export MANPAGER="nvim -c 'set ft=man' -"
export TERM="xterm-256color"
export ZSH="/home/k0ss4/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export ZSH_COMPDUMP="/home/$USER/.cache/zsh/zcompdump"

#My aliases

source .ssh-aliases

alias ohmyzsh="upgrade_oh_my_zsh"
alias config="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias ls="exa -la"
alias cat="bat"
alias s="git status"
alias a="git add"
alias c="git commit -m"
alias pom="git push origin main"
alias cronlog="sudo journalctl | grep CRON"
alias crontab="EDITOR=nvim crontab -e"
alias remove="udisksctl power-off -b"

function geoip {
	curl https://ipapi.co/$1/$2/
}

eval "$(starship init zsh)"
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

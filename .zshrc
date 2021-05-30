#Pfetch config
#export PF_SEP=":"
#export PF_COL1=4
#export PF_COL2=4
#export PF_COL3=2
#export PF_ALIGN="8"

#/home/k0ss4/.pfetch/./pfetch
colorscript -r
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Exports ###
export MANPAGER="nvim -c 'set ft=man' -"
export TERM="xterm-256color"
export ZSH="/home/k0ss4/.oh-my-zsh"
export PATH="${PATH}:/home/k0ss4/.emacs.d/bin"

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
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

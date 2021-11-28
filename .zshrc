#Pfetch config
export PF_SEP=":"
export PF_COL1=4
export PF_COL2=4
export PF_COL3=2
export PF_ALIGN="8"

#/home/k0ss4/.pfetch/./pfetch
colorscript -r

### Exports ###
export PATH="${PATH}:/home/k0ss4/.local/bin"
export MANPAGER="nvim -c 'set ft=man' -"
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"

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
alias remove="udisksctl power-off -b"
alias conn="windscribe connect"
alias dis="windscribe disconnect"
alias poweroff="/home/k0ss4/.local/bin/firefox-sync.sh d3p2n458.default-default >> /dev/null; poweroff"
alias reboot="/home/k0ss4/.local/bin/firefox-sync.sh d3p2n458.default-default >> /dev/null; reboot"

function geoip {
	curl https://ipapi.co/$1/$2/
}

eval "$(starship init zsh)"

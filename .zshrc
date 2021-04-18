neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### Exports ###
export MANPAGER="nvim -c 'set ft=man' -"
export TERM="xterm-256color"
export ZSH="/home/k0ss4/.oh-my-zsh"
export PATH="${PATH}:/home/k0ss4/.emacs.d/bin"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git archlinux zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

function geoip {
	curl https://ipapi.co/$1/$2/
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

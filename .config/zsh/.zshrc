# Lines configured by zsh-newuser-install
HISTFILE=~/.local/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/winter/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Prompt
PS1="
┌%K{098} %n %k%K{105}%F{098}%f %/ %k%F{105}%f
└ ❱ "

#Variables
GOPATH=$HOME/go
PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

#Aliases
alias ls="lsd"
alias gittoken="wl-copy < ~/.local/share/gittoken"
alias cclear="wl-copy --clear"

#Initalizing programs
clear
fastfetch


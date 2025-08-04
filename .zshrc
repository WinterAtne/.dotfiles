# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
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
COWPATH=$HOME/.dotfiles/CowPath/

#Aliases
alias ls="lsd"

#Initalizing programs
clear
fastfetch


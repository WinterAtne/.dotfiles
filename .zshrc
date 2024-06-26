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
PS1="%F{#eeeeee}%n %1~:%f "

#Aliases
alias ls="lsd"
alias stvol="pactl set-sink-volume @DEFAULT_SINK@"

#Initalizing programs
clear
fastfetch


#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# base16 color scheme
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
source .config/base16-shell/base16-default.sh

# prompt customisation
#PS1='[\u@\h \W]\$ '  # default
#PS1='\[\e[1;30m\][\u@\h:\w]\$\[\e[0m\] '  # dark grey
export PS1='\[\e[0;37m\][\u@\h:\w]\$\[\e[0m\] '  # light grey

# extend bash's native tab-completion
# pacman -S bash-completion

# add ~/Hackery/bin bash to beginning of PATH, making it possible to override
# commands... ln -s /usr/bin/python2 ~/Hackery/bin/python
export PATH="~/Hackery/bin:${PATH}" 

# perferred pager and editor
export PAGER='less'
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gvim'; else echo 'vim'; fi)"
export VISUAL='vim'

# less options
export LESS='--ignore-case --LONG-PROMPT'

# disable x11-ssh-askpass
unset SSH_ASKPASS

# matches filenames in a case-insensitive fashion when performing pathname
# expansion, see also readline option completion-ignore-case
shopt -s nocaseglob

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS
shopt -s checkwinsize

# a command name that is the name of a directory is executed as if it were the
# argument to the cd command
shopt -s autocd

# endless history
export HISTSIZE=-1

# append to the history file, rather than overwriting it
shopt -s histappend

# don't add duplicate lines or lines starting with a space to the history
export HISTCONTROL=ignoreboth

# trap to intercept non-zero exit codes
exitcode() { echo -e '\e[1;31m'Exit $?'\e[m'; } && trap exitcode ERR

# aliases
alias diff='colordiff'  # pacman -S colordiff
alias grep='grep --color=auto'
alias dmesg='dmesg --human --color=auto'
alias ls='ls --human-readable --classify --color=auto'
alias ll='ls -l'
alias la='ll -a'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias more='less'
alias exit=' exit'
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'

# advertise gnome-terminal's colour capabilities
# gnome-terminal sets TERM=xterm by default and TERM=gnome-256color breaks
# things, vim's set title for example
if [ "${COLORTERM}" = 'gnome-terminal' ] ; then
  if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
  fi
fi

# display a pseudorandom message/quote whenever this file is sourced
command fortune -a ; echo  # pacman -S fortune-mod

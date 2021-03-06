# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    export PATH=~/bin:"${PATH}"
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#MY PREFERENCES ==============================================================
export EDITOR VISUAL GIT_EDITOR
EDITOR=vim
VISUAL=$EDITOR
GIT_EDITOR=$EDITOR

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

#unmap CTRL-S and CTRL-Q
stty -ixon -ixoff

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

terminal=$(ps -o comm= $PPID)
case "$terminal" in
lxterminal|gnome-terminal|xfce4-terminal)
    export TERM=xterm-256color
    ;;
esac

case "$TERM" in
*-256col*)
    # All's well.
    ;;
*-col*)
    echo LOW COLOR TERM: $TERM, $terminal
    ;;
*)
    echo NO COLOR TERM: $TERM, $terminal
    ;;
esac

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1
alias ll='ls -lAGph'

# vim:et:sw=2:sts=2:

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

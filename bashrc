# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
# export HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups:ignorespace

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=100000
export HISTFILE=~/.bash_history_save
export PROMPT_COMMAND='history -a'

shopt -s cdspell
shopt -s dotglob

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

JH=/opt/java
if [ -d $JH ] ; then 
    export JAVA_HOME=$JH
    PATH=$JAVA_HOME/bin:${PATH}
fi

MH=/opt/maven
if [ -d $MH ] ; then 
    export MAVEN_HOME=$MH
    PATH=$MAVEN_HOME/bin:${PATH}
fi

# 2009-04-27 - special configuration should be used because of local maven repository
#MH2=/opt/m2
#if [ -d $MH2 ] ; then
#    export M2_HOME=$MH2
#    PATH=$M2_HOME/bin:${PATH}
#fi

ANT_HOME=/opt/apache-ant
if [ -d $ANT_HOME ] ; then
    export ANT_HOME
    PATH=$ANT_HOME/bin:${PATH}
fi

J6H=/opt/java6
if [ -d $J6H ] ; then 
    export JAVA6_HOME=$J6H
fi

J5H=/opt/java5
if [ -d $J5H ] ; then
    export JAVA5_HOME=$J5H
fi

J4H=/opt/java4
if [ -d $J4H ] ; then
    export JAVA4_HOME=$J4H
fi

if [ -d /opt/scala ]; then
   export SCALA_HOME=/opt/scala
   export PATH=$SCALA_HOME/bin:$PATH
fi

if [ -d ~/opt/node ]; then 
   export NODEJS_HOME=~/opt/node
   export PATH=$NODEJS_HOME/bin:$PATH
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

SCH=/opt/scala
if [ -d $SCH ] ; then 
    PATH=$SCH/bin:"${PATH}"
    export SCALA_HOME=$SCH
fi

export CDPATH=.:~/work/diso21:A

JAVAFXH=/opt/javafx
if [ -d $JAVAFXH ] ; then
    PATH=$JAVAFXH/bin:"${PATH}"
    export JAVAFX_HOME=$JAVAFXH
fi

AXIS2H=~/opt/axis2

if [ -d $AXIS2H ] ; then 
	PATH=$AXIS2H/bin:"${PATH}"
	export AXIS2_HOME=$AXIS2H
fi

CXFH=~/opt/apache-cxf

if [ -d $CXFH ] ; then 
	PATH=$CXFH/bin:"${PATH}"
	export CXF_HOME=$CXFH
fi





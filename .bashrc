#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias open='xdg-open'

# Prompt configuation
PS1='[\u@\h \W]\$ '


# Java environment setup
export JAVA_HOME=/usr/local/java/jre1.8.0_391
export PATH=$PATH:$JAVA_HOME/bin


# Custom Git commit function
gitac() {
   git add .
   git commit -m "$*"
}

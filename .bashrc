#
# ~/.bashrc
#

source ~/alias_registry.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt configuration
PS1='[\u@\h \W]\$ '

# Java environment setup
export JAVA_HOME=/home/dean/.jdks/corretto-21.0.1
export PATH=$JAVA_HOME/bin:$PATH

# Define LS_COLORS with color variations for similar file types
LS_COLORS='di=1;34:'
LS_COLORS+='*.jpg=1;35:*.jpeg=1;35:*.png=1;36:*.gif=1;36:*.bmp=1;95:*.tiff=1;95:'
LS_COLORS+='*.avi=1;33:*.mp4=1;33:*.mkv=1;91:*.mov=1;91:*.flv=1;94:*.wmv=1;94:'
LS_COLORS+='*.rar=1;31:*.zip=1;31:*.tar.gz=1;31:*.tar.bz2=1;31:*.tar.xz=1;31:'
LS_COLORS+='*.txt=0;32:*.pdf=1;32:*.doc=0;32:*.docx=0;32:*.odt=0;32:'
LS_COLORS+='*.sh=1;92:*.exe=1;92:*.bin=1;92:*.bash=1;92:'
LS_COLORS+='fi=0:no=0:ln=1;36:'
export LS_COLORS


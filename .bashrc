#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias grep='grep --color=auto'
alias open='xdg-open'
alias math='/home/dean/Dev/cli_calculator/calc.py'
alias ghrepo='gh repo list deanofwalls --limit 1000 --visibility public  --json name,description,url'
alias update='sudo pacman -Syu && sudo pacman -Rns $(pacman -Qtdq) && sudo paccache -r'


# Custom ls alias to use the external script
alias ls="~/Dev/my_arch_mods/custom_ls.sh"

# Prompt configuration
PS1='[\u@\h \W]\$ '

# Java environment setup
export JAVA_HOME=/usr/local/java/jre1.8.0_391
export PATH=$PATH:$JAVA_HOME/bin

# Custom Git commit function
gitac() {
   git add .
   git commit -m "$*"
   git push
}

# Define gitpast function
gitpast() {
local date_str=$1
local time_str="$2"
local commit_msg="$3"

# Check if all arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: gitpast YYYY-mm-dd hh:mm 'Commit Message Here'"
    return 1
fi

# Construct the complete date and time string
local datetime_str="${date_str} ${time_str}"

# Commit with the specified date and commit message
git commit --date="$datetime_str" -m "$commit_msg"
}

# Define LS_COLORS with color variations for similar file types
LS_COLORS='di=1;34:'
LS_COLORS+='*.jpg=1;35:*.jpeg=1;35:*.png=1;36:*.gif=1;36:*.bmp=1;95:*.tiff=1;95:'
LS_COLORS+='*.avi=1;33:*.mp4=1;33:*.mkv=1;91:*.mov=1;91:*.flv=1;94:*.wmv=1;94:'
LS_COLORS+='*.rar=1;31:*.zip=1;31:*.tar.gz=1;31:*.tar.bz2=1;31:*.tar.xz=1;31:'
LS_COLORS+='*.txt=0;32:*.pdf=1;32:*.doc=0;32:*.docx=0;32:*.odt=0;32:'
LS_COLORS+='*.sh=1;92:*.exe=1;92:*.bin=1;92:*.bash=1;92:'
LS_COLORS+='fi=0:no=0:ln=1;36:'
export LS_COLORS

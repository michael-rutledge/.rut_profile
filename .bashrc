## colors ##
nc=$'\e[0;m'
b_nc=$'\e[1m'
black=$'\e[0;30m'
b_black=$'\e[1;30m'
red=$'\e[0;31m'
b_red=$'\e[1;31m'
green=$'\e[0;32m'
b_green=$'\e[1;32m'
yellow=$'\e[0;33m'
b_yellow=$'\e[1;33m'
blue=$'\e[0;34m'
b_blue=$'\e[1;34m'
magenta=$'\e[0;35m'
b_magenta=$'\e[1;35m'
cyan=$'\e[0;36m'
b_cyan=$'\e[1;36m'
white=$'\e[0;37m'
b_white=$'\e[1;37m'

## Interface Options ##
parse_git_branch () {       # function that fetches current git branch
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# Shell prompt
export PS1="\[${cyan}\]\h\[${nc}\]:\[${magenta}\]\t_\
\[${b_yellow}\]\w\[${green}\]\$(parse_git_branch) \[${nc}\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
## History Options ##
export HISTCONTROL=ignoredups:ignorespace   #history ignores duplicates
export HISTSIZE=10000   #history of 10000 commands
export IGNOREEOF=2  #control-D needs to be hit twice to exit
## Advanced Search History ##
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'


## Advanced Options ##
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

## Fetch custom environment variables ##
source "$HOME"/.rut_profile/customEnv.sh 2> /dev/null
if [[ $? != 0 ]]; then
echo "No custom environment variables found. \
Store custom environment variables in customEnv.sh within .rut_profile"
fi

## cd Options ##
alias cd='>/dev/null cd' #drop output of cd using CDPATH, preserving error output
alias pd='cd $OLDPWD' #go back to previous directory
alias ..='cd ..' #previous directory stuff
alias ...='cd ../..'
alias ....='cd ../../..'

## Listing Options ##
if [[ $(uname -s) == Linux ]]
then
    alias ls='ls -CF --color=auto'
else
    alias ls='ls -GFh'
fi
alias ll='ls -alF' #long listing
alias la='ls -A' #list all files

## Grep Options ##
alias grep='grep --color=always'

## Bash Profile Access Options ##
alias rebash='source ~/.bashrc' #refresh bashrc
alias edbash='vim ~/.bashrc' #edit bashrc

## Editor Options ##
alias vi='vim'
alias v='vim'

## Git options ##
# All of these reduce git commands to just two or three letters
# Makes typing a high volume of commands  much easier
alias ga='git add'
alias gau='git add -u'
alias gb='git branch'
alias gc='git commit -m'
alias gch='git checkout'
# Some commands, like git diff (below), have been modified to output to less
# They retain all colored output, but goes away on exit, meaning less clutter on screen
gd () {
    git diff --color=always $@ | less -R
}
alias gl='git log --color=always | less -R'
alias gp='git push'
alias gs='git -c color.status=always status | less -R'
alias gt="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all | less -r"

## assorted bash functions ##
# colored man page
# mb/md,me: start,end bold
# so,se: start,end standout
# us,ue: start, end underline
man () {
    LESS_TERMCAP_mb=${b_yellow} \
    LESS_TERMCAP_md=${b_yellow} \
    LESS_TERMCAP_me=${nc} \
    LESS_TERMCAP_so=${red} \
    LESS_TERMCAP_se=${nc} \
    LESS_TERMCAP_us=${b_green} \
    LESS_TERMCAP_ue=${nc} \
    command man $@
}

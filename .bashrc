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
## Ignore case on autocomplete ##
bind 'set completion-ignore-case on'


## Advanced Options ##
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

## cd Options ##
alias pd='cd - >/dev/null' #go back to previous directory
cdn() {
    cdp=""
    for i in `seq $1`; do cdp="$cdp../"; done;
    cd "$cdp"
}

## Listing Options ##
if [[ $(uname -s) == Linux ]] #make changes to ls depending on platform
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
alias gpo='git push origin'
alias gpoh='git push origin HEAD'
alias gs='git -c color.status=always status | less -R'
gsh () {
    git show --color=always $@ | less -R
}
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
# function that prints out a bunch of test text to check colors
function color_test {
  #   Daniel Crisman's ANSI color chart script from
  #   The Bash Prompt HOWTO: 6.1. Colours
  #   http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
  T='gYw'   # The test text
  echo -e "\n         def     40m     41m     42m     43m     44m     45m     46m     47m";
  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}

## One-off aliases ##
alias ascii='man ascii' #print out an ascii table in terminal
hx () {
    # make using the built-in hex viewer xxd cleaner
    xxd $@ | less -R
}

## Fetch custom environment variables and aliases ##
## Can overwrite anything I have here ##
source "$HOME"/.rut_profile/customEnv.sh 2> /dev/null
if [[ $? != 0 ]]; then
echo "customEnv.sh not found. Make sure .rut_profile is installed in your home directory\
 and then run link.sh"
fi

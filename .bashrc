## pre-parsing ##
parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

## Interface Options ##
export PS1="\[\033[36m\]\h\[\033[m\]:\[\033[35m\]\t_\[\033[33;1m\]\w\[\033[m\]\
\[\033[32m\]\$(parse_git_branch) \[\033[m\]\$ "
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


## cd Options ##
export CDPATH='.:~:/:~/Desktop/repos'
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

## Bash Profile Access Options ##
alias rebash='source ~/.bashrc' #refresh bashrc
alias edbash='vim ~/.bashrc' #edit bashrc

## Editor Options ##
alias vi='vim'
alias v='vim'

## Git options ##
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m'
gd () {
    git diff --color=always $@ | less -R
}
alias gp='git push'
alias gs='git -c color.status=always status | less -R'
alias gu='git up'
alias gl='git log --color=always | less -R'
alias gt="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all | less -r"
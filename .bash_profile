#Interface options
export PS1="\[\033[36m\]\u\[\033[m\]:\[\033[35m\]\t_\[\033[33;1m\]\w\[\033[m\]:\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#history options
export HISTCONTROL=ignoredups:ignorespace   #history ignores duplicates
export HISTSIZE=10000   #history of 10000 commands
export IGNOREEOF=2  #control-D needs to be hit twice to exit
#this should do advanced search history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'


# general aliasing
if [[ $(uname -s) == Linux ]]
then
    alias ls='ls -CF --color=auto'
else
    alias ls='ls -GFh'
fi
alias ll='ls -alF'
alias la='ls -A'
alias rebash='source ~/.bash_profile'

# git aliasing
alias gs='git status'
alias gc='git commit -m'
alias ga='git add'
alias gau='git add -u'

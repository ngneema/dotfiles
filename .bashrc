#export PS1="\u@\h:\w \$"
#export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
#PS1="\u@\h [\$CurDir] \$ "
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\n\[\033[32m\]\u@\h\[\033[32m\] \t\[\033[33m\] \w $(parse_git_branch)\[\033[0m\]\n>: '
alias cvs_stat='cvs -n -Q status | grep File | grep -v Up-to-date'
alias cgrep='grep -n'
function cdl { cd $1; ls -l | less;}
function psgrep() { ps -ef | grep -v grep | grep "$@"; }
function fname() { find . -name "*$@*"; }
set -o vi
if [ -f /usr/local/bin/safedelete ]
    then
    alias rm='/usr/local/bin/safedelete'
    alias purge='/bin/rm'
fi
alias make='/usr/bin/gmake'
export TERM=dtterm
alias ls='/opt/freeware/bin/ls --color'
alias vi="vim"
. /etc/axonprofile

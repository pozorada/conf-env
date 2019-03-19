export JAVA_HOME=$(/usr/libexec/java_home)

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

_kill() {
   ~/custom/kill_process.sh $1
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ll='ls -al'
alias gb='git symbolic-ref --short -q HEAD'
alias gp='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gs="git status"
alias ga="git add ."


source ~/git-flow-completion/git-flow-completion.bash

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# this is to add postgresql to PATH
export PATH=/opt/local/lib/postgresql93/bin:$PATH

alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper start';
alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper stop';
alias postgres_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql93-server/postgresql93-server.wrapper restart';

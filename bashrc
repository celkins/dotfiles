# http://www.turnkeylinux.org/blog/generic-shell-hooks
#
run_scripts()
{
    for script in $1/*; do

        # skip non-executable snippets
        [ -x "$script" ] || continue

        # execute $script in the context of the current shell
        . $script
    done
}

run_scripts ~/.bashrc.d

export BROWSER='open'
export CLICOLOR='1'

export PAGER='less'
export LESS='eiMRsXx4'

command -v lesspipe.sh >/dev/null 2>&1 && {
  export LESSOPEN="|lesspipe.sh %s"
}

alias ..='cd ..'
alias cd..='cd ..'
alias ha='history -a'
alias hn='history -n'
alias ll='ls -al'
alias md='mkdir -p'
alias po='popd'
alias pu='pushd'

set -o ignoreeof
set -o noclobber

shopt -s cdspell
shopt -s histappend

cd() {
  builtin cd "$1"
  pwd
}

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
PS1='[\u@\h \W]$ '

GPG_TTY=$(tty)
export GPG_TTY

if [ $(command -v aws) ]; then
  complete -C aws_completer aws
fi

if [ $(command -v boot2docker) ]; then
  eval "$(boot2docker shellinit >/dev/null 2>&1)"
fi

if [ $(command -v brew) ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
    . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    PS1="[\u@\h \W]\$(__git_ps1 \" (%s)\")\$ "
  fi
  alias brewup='GIT_MERGE_AUTOEDIT=no brew update'
fi

if [ $(command -v hub) ]; then
  eval "$(hub alias -s)"
fi

if [ $(command -v jenv) ]; then
  eval "$(jenv init -)"
fi

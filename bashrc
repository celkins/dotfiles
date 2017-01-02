# -*- mode: sh -*-

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
alias pbclean='pbpaste | pbcopy'
alias po='popd'
alias pu='pushd'

set -o ignoreeof
set -o noclobber

shopt -s cdspell

# Use conventional history management in the absence of Apple Terminal's resume support
if ! [ -n "$TERM_SESSION_ID" ]; then
  shopt -s histappend
fi

cd() {
  builtin cd "$1"
  pwd
}

if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi

GPG_TTY=$(tty)
export GPG_TTY

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

export BROWSER='open'
export CLICOLOR='1'

export PAGER='less'
export LESS='eiMRsXx4'
export LESSHISTFILE=-

command -v lesspipe.sh >/dev/null 2>&1 && {
  export LESSOPEN="|lesspipe.sh %s"
}

alias ..='cd ..'
alias cd..='cd ..'
alias cp='cp -i'
alias ha='history -a'
alias hn='history -n'
alias ll='ls -al'
alias md='mkdir -p'
alias mv='mv -i'
alias pbclean='pbpaste | pbcopy'
alias po='popd'
alias pu='pushd'

# Always enable colored `grep` output
alias grep='grep --color=auto '

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map='xargs -n1'

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

run_scripts ~/.bashrc.d

if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
elif [ -f "${HOMEBREW_PREFIX}/share/liquidprompt" ]; then
  . "${HOMEBREW_PREFIX}/share/liquidprompt"
fi

GPG_TTY=$(tty)
export GPG_TTY


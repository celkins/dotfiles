LC_CTYPE='en_US.UTF-8'; export LC_CTYPE

BROWSER='open';     export BROWSER
CLICOLOR='1';       export CLICOLOR

if command -v mate >/dev/null; then
  EDITOR='mate -w'
  GIT_EDITOR='mate -wl1'; export GIT_EDITOR
else
  EDITOR='vi'
fi
export EDITOR

VISUAL="${EDITOR}"; export VISUAL

PAGER='less';               export PAGER
LESS='eiMRsXx4';            export LESS
LESSEDIT='mate -l %lm %f';  export LESSEDIT

command -v lesspipe.sh >/dev/null 2>&1 && {
  LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
}

[ -d "${HOME}/bin" ] && PATH=${HOME}/bin:${PATH}; export PATH

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

if [ -z "$GOPATH" ]; then
GOPATH=$HOME; export GOPATH
fi

CDPATH=.:$GOPATH/src:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org:$GOPATH/src/code.google.com/p

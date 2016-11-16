# -*- mode: sh -*-

LC_CTYPE='en_US.UTF-8'; export LC_CTYPE

[ -d "${HOME}/bin" ] && PATH=${HOME}/bin:${PATH}; export PATH

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

if [ -z "$GOPATH" ]; then
GOPATH=$HOME; export GOPATH
fi

CDPATH=.:$GOPATH/src:$GOPATH/src/github.com:$GOPATH/src/bitbucket.org:$GOPATH/src/code.google.com/p

LC_CTYPE='en_US.UTF-8'; export LC_CTYPE

BROWSER='open';     export BROWSER
CLICOLOR='1';       export CLICOLOR

if command -v mate >/dev/null; then
  EDITOR='mate -w'
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

if [ -z "$GOPATH" -a "$BOXEN_SRC_DIR" ]; then
  GOPATH="${BOXEN_SRC_DIR}/go"; export GOPATH
fi
if [ "$GOPATH" ]; then
  [ -d "$GOPATH/bin" ] && PATH=$PATH:$GOPATH/bin; export PATH
fi

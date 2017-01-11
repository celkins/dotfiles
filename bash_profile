# -*- mode: sh -*-

#FIXME This should use a Darwin-specific location (e.g., ~/Library/Preferences)
# but need to test interaction with existing configs (e.g., git).
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

if [ "$(uname -s)" == "Darwin" ]; then
  export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/Library/Caches}
  export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/Library}
else
  export XDG_CACHE_HOME=${XDG_CACHE_HOME:=$HOME/.cache}
  export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
fi

if [ -f ~/.profile ];       then . ~/.profile;       fi
if [ -r ~/.profile.local ]; then . ~/.profile.local; fi

if [ -f ~/.bashrc ];       then . ~/.bashrc;       fi
if [ -r ~/.bashrc.local ]; then . ~/.bashrc.local; fi

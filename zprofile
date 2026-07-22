# -*- mode: sh -*-
# Login shells, after macOS /etc/zprofile (which runs path_helper).

# Homebrew: sets PATH, MANPATH, INFOPATH, FPATH (zsh completions), HOMEBREW_PREFIX.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Personal bin ahead of the rest.
[ -d "${HOME}/bin" ] && export PATH="${HOME}/bin:${PATH}"

GPG_TTY=$(tty)
export GPG_TTY

[ -r "${HOME}/.zprofile.local" ] && . "${HOME}/.zprofile.local"

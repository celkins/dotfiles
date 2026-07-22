# -*- mode: sh -*-
# Sourced for every zsh (login, interactive, scripts). Keep minimal.

# macOS-native cache dir: the OS purges it under disk pressure and Time Machine
# excludes it, so regenerable data stays out of backups. XDG_CONFIG_HOME and
# XDG_DATA_HOME are deliberately left unset — the spec defaults (~/.config,
# ~/.local/share) are already what we want, and overriding DATA_HOME to
# ~/Library scattered tool dirs among Apple's own.
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/Library/Caches}

export LC_CTYPE=en_US.UTF-8

[ -r "${HOME}/.zshenv.local" ] && . "${HOME}/.zshenv.local"

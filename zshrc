# -*- mode: sh -*-

run_scripts() {
  for script in "$1"/*(N); do
    [ -x "$script" ] || continue
    . "$script"
  done
}

export CLICOLOR='1'

export PAGER='less'
export LESS='eiMRsXx4'
export LESSHISTFILE=-

if command -v lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN="|lesspipe.sh %s"
fi

alias cd..='cd ..'
alias cp='cp -i'
alias md='mkdir -p'
alias mv='mv -i'
alias pbclean='pbpaste | pbcopy'
alias po='popd'
alias pu='pushd'
alias grep='grep --color=auto '
alias map='xargs -n1'

# Shell options
setopt ignore_eof         # Ctrl-D does not exit the shell
setopt no_clobber         # > won't overwrite an existing file; use >| to force
setopt auto_cd            # a bare directory path cd's into it (replaces the '..' alias)
setopt auto_pushd         # every cd pushes onto the dir stack, so po/pu walk back
setopt pushd_ignore_dups  # ...without stacking consecutive duplicates
setopt no_case_glob       # *.TXT matches .txt, like the completion matcher
setopt interactive_comments  # allow '# comment' on the interactive line

# History
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups hist_ignore_space
setopt hist_verify        # !! / !$ expand onto the line instead of running immediately

# Completion (replaces bash-completion)
# -u: Homebrew's completion dirs (/opt/homebrew/share/zsh/...) are owned by the
# admin account and group-writable, which compinit rejects as insecure and then
# ABORTS on — which silently breaks completion, including the case-insensitive
# matcher below. -u trusts them (consistent with already trusting brew's
# binaries). We can't chmod them (admin owns them, and brew resets the perms).
# Stricter alt: -i skips them but loses brew's tool completions.
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# Word boundaries for the word widgets (Option+Delete, Option+arrows).
# zsh's default WORDCHARS includes - _ . / = etc., so backward-kill-word eats a
# whole hyphenated name or path. Empty means alphanumerics only, matching
# readline/bash: delete one token at a time.
WORDCHARS=''

# Prefix history search on Up/Down (zsh's default is a plain history walk).
# The old ~/.inputrc also bound Alt+Delete to "delete the preceding word" —
# dropped, because zsh already binds ^[^? (Option+Delete) to backward-kill-word.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

run_scripts "${HOME}/.zshrc.d"

[ -r "${HOME}/.zshrc.local" ] && . "${HOME}/.zshrc.local"

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
setopt COMPLETE_ALIASES
autoload -Uz compinit
compinit

[[ $- = *i* ]] && [[ -f ~/dotfiles/liquidprompt/liquidprompt/liquidprompt ]]  && source ~/dotfiles/liquidprompt/liquidprompt/liquidprompt

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi

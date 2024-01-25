HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
export KEYTIMEOUT=50

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
#
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi
setopt COMPLETE_ALIASES

if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit
autoload -U promptinit &&  promptinit

zstyle :prompt:pure:git:stash show yes

prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export DRACULA_THEME=$HOME/dotfiles/colors/colorschemes/dracula-theme/
export NODE_OPTIONS='--max_old_space_size=8192'

ulimit -n 8096

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

fpath=(~/.zsh/completion $fpath)

export MYSQL_PS1="\u@\h [\d]> "
fpath+=${ZDOTDIR:-~}/.zsh_functions
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export GOPATH=~/go
export PATH=$PATH:/$GO_PATH/bin

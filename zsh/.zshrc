source "$HOME/.vim/pack/minpac/start/gruvbox/gruvbox_256palette.sh"
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob nomatch
bindkey -v

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
setopt COMPLETE_ALIASES

eval "$(starship init zsh)"

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

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i

deeplink() {
  if [[ $1 == "ios" ]]; then
    echo "ios: $2"
    xcrun simctl openurl booted "$2"
  elif [[ $1 == "android" ]]
    echo "android: $2"
  then
    adb shell am start -W -a android.intent.action.VIEW -d "$2" com.pph.debug
  fi
}

rn-clean() {
  watchman watch-del-all
  rm -rf ${TMPDIR}react-*
  rm -rf ${TMPDIR}haste-*
  rm -rf ${TMPDIR}metro-*
}

export MYSQL_PS1="\u@\h [\d]> "
fpath+=${ZDOTDIR:-~}/.zsh_functions

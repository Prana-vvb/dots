# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
# End of lines configured by zsh-newuser-install
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

eval "$(starship init zsh)"

source ~/.zsh/aliases
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

ENABLE_CORRECTION="true"

zstyle ':completion:*' menu select
zstyle ':completion:*' completer _complete _ignored _approximate

# cd() {
#     builtin cd "$@" || return
#     if [ -d ".git" ]; then
#         git pull
#     fi
# }


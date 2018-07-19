# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

# Path to vim
export MYVIMRC='~/.vim/.vimrc'

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Enable command auto-correction.
ENABLE_CORRECTION="false"

# To change command execution timestamps shown in the history command output
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# For now, just use the default oh-my-zsh custom folder # ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  colored-man-pages
  colorize
  common-aliases
  git
  git-extras
  gnu-utils
  h
  last-working-dir
  osx
  tmux
  vi-mode
  web-search
  Z
  zsh-open-pr
  zsh_reload
  zsh-syntax-highlighting # Must be last
)

source $ZSH/oh-my-zsh.sh

# Path to vim
export MYVIMRC='~/.vim/.vimrc'

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel10k/powerlevel10k"

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
  #gnu-utils # BREAKS colors
  last-working-dir
  tmux
  vi-mode
  #web-search
  Z
)

source $ZSH/oh-my-zsh.sh

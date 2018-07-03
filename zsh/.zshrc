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
# For now, just use the default oh-my-zsh custom folder
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

export TZ=/usr/share/zoneinfo/US/Eastern

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias ls='ls --color=auto'
alias cl='clear'
# Avoid confirmation of deleting regular files since oh-my-zsh defaults rm to 'rm -i'
setopt rm_star_silent

# Tmux aliases
alias tmux-attach-or-create-main-session='tmux new-session -A -s main'
alias tls='tmux list-sessions'
alias ts='tmux new-session -s'
alias tas='tmux attach-session -t'
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias tksv='tmux kill-server'
alias tkill='tmux kill-session -t'
alias tsw='tmux switch -t'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

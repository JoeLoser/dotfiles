# Tmux aliases {{{
alias tmux-attach-or-create-main-session='tmux new-session -A -s main'
alias tls='tmux list-sessions'
alias ts='tmux new-session -s'
alias tas='tmux attach-session -t'
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias tksv='tmux kill-server'
alias tkill='tmux kill-session -t'
alias tsw='tmux switch -t'
# }}}

# Nifty aliases {{{
alias cl='clear'
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
# }}}


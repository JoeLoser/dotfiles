export FZF_DEFAULT_OPS="--extended --ansi"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --color=always --hidden --follow --exclude .git 2> /dev/null'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_COMPLETION_OPTS='+c -x'


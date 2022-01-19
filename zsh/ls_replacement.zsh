if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias la="exa --long --all --group"
fi

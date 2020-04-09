# PATH config
typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

# FPATH config
typeset -U FPATH fpath
fpath=("$HOME/.config/zsh/plugins/pure" "$fpath[@]")
export FPATH

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Move .zshrc to .config
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"


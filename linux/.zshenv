# PATH config
typeset -U PATH path
export FLYCTL_INSTALL="/home/coderz/.fly"
path=("$HOME/bin" "$HOME/.local/bin" "$FLYCTL_INSTALL/bin" "$HOME/.cargo/bin" "$HOME/go/bin" "/opt/lampp/bin" "/usr/local/go/bin" "$path[@]" )
export PATH

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Move .zshrc to .config
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

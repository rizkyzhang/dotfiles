source $HOME/.config/zsh/aliases.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## SSH Keychain
/usr/bin/keychain -q $HOME/.ssh/id_rsa_personal
/usr/bin/keychain -q $HOME/.ssh/id_rsa_personal-2
source $HOME/.keychain/$HOST-sh

## Auto Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

## History Config
HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_all_dups # Ignore all duplicate commands
setopt hist_ignore_space # Ignore commands that start with a space
setopt hist_save_no_dups # Remove old duplicate commands
setopt inc_append_history # Immediately append history
setopt share_history # Share history across sessions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/coderz/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/coderz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/coderz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/coderz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate test-face

## NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

## Zgenom
# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # plugins
    zgenom load zdharma-continuum/fast-syntax-highlighting.git
    zgenom load sindresorhus/pure.git

    # completions
    zgenom load zsh-users/zsh-completions.git
    zgenom load zsh-users/zsh-autosuggestions.git

    # save all to init script
    zgenom save

    # Compile your zsh files
    zgenom compile "$HOME/.config/zsh/.zshrc"
    zgenom compile $ZDOTDIR
fi

# Zoxide should always be put at the end to works
eval "$(zoxide init zsh)"

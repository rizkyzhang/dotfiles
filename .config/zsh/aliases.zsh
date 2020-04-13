# Config
alias ali='nvim ~/.config/zsh/aliases.zsh'
alias plug='nvim ~/.config/nvim/plugins.vim'
alias re='source ~/.config/zsh/.zshrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshenv='nvim ~/.zshenv'
alias zshrc='nvim ~/.config/zsh/.zshrc'

# Git
alias ga='git add'
alias gb='git branch -a'
alias gc='git commit -m'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias go='git checkout'
alias gom='git checkout master'
alias gp='git push origin master'
alias grd='cd "$(git rev-parse --show-toplevel)"'
alias gs='git status'

# Navigation
alias b='cd ..'
alias la='ls -a'
alias ll='ls -ahl'

# Packages
alias pla='for pkg in $(apt-cache pkgnames | sort); do printf "$pkg - $(apt-cache show $pkg | grep -m 1 "Description:"  | cut -c 14-)\n"; done'
alias pli='pkg list-installed'
alias psh='pkg show'

# Programming
alias live='live-server --host=127.0.0.1 --port=8080'
alias pr='cd ~/projects'
alias vim='nvim'

# Scripts
alias co='covid19-cli'
alias coc='covid19-cli china'
alias coi='covid19-cli indonesia'
alias com='covid19-cli malaysia'
alias cow='covid19-cli world'

# System
alias br='termux-brightness'
alias cl='clear'
alias ro='unset LD_PRELOAD && export LD_PRELOAD=$PREFIX/lib/libtermux-exec.so && termux-chroot'


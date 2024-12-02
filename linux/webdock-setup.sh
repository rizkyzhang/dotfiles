#!/bin/zsh

# Copy dotfiles
cd
cp -R ~/dotfiles/linux/. .
mkdir -p ~/.cache/zsh && touch ~/.cache/zsh/history

# Setup shell
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
mkdir ~/bin
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-musl_0.24.0_amd64.deb && sudo apt install ./bat-musl_0.24.0_amd64.deb
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt install -y eza
sudo snap install nvim --classic

# Code
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
sudo snap install go --classic
source ~/.zshenv
source ~/.config/zsh/.zshrc
nvm install --lts && npm i -g pnpm yarn
go install github.com/Gelio/go-global-update@latest
go install github.com/jesseduffield/lazydocker@latest

# Docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo usermod -aG docker $USER
sudo docker network create personal

# Selfhost setup
## Dockge
sudo mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge
sudo cp ~/dotfiles/linux/dockge-compose.yaml compose.yaml
sudo docker compose up -d
## Nginx Proxy Manager
sudo systemctl stop mariadb
sudo systemctl stop nginx
sudo systemctl stop php8.3-fpm
sudo mkdir -p /opt/stacks/npm
cd /opt/stacks/npm
sudo cp ~/dotfiles/linux/npm-compose.yaml compose.yaml
sudo docker compose up -d

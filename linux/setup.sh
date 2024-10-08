#!/bin/zsh

# Secure SSH
sudo sed -i 's/#Port 22/Port 4957/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

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
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage && mv nvim.appimage bin
sudo apt install exa

# Code
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
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
docker network create personal

# Selfhost setup
## Dockge
sudo mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge
sudo cp ~/dotfiles/linux/dockge-compose.yaml compose.yaml
docker compose up -d
## Nginx Proxy Manager
sudo mkdir -p /opt/stacks/npm
cd /opt/stacks/npm
sudo cp ~/dotfiles/linux/npm-compose.yaml compose.yaml
docker compose up -d

# Firewall
sudo ufw enable
sudo ufw allow 4957/tcp

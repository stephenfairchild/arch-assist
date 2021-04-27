#! /usr/bin/sh

# Set default shell to zsh
sudo chsh -s /bin/zsh $(whoami)

# Remove bash defaults
rm -rvf ~/.bashrc ~/.bash_history

# Remove existing SSH and .local if they exist
rm -rvf ~/.ssh
rm ~/.vim.local

# Setup
mkdir -m700 -p ~/.ssh
touch ~/.ssh/id_rsa
touch ~/.ssh/id_rsa.pub
touch ~/.ssh/config

# Create SSH key files
lpass show ssh-private-key --notes --fixed-strings | tee ~/.ssh/id_rsa > /dev/null
lpass show ssh-public-key --notes --fixed-strings | tee ~/.ssh/id_rsa.pub > /dev/null

# Create SSH config file
lpass show ssh-config --notes --fixed-strings | tee ~/.ssh/config > /dev/null

# Set Permissions
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

# Create .vim.local
lpass show vim-local --notes --fixed-strings | tee ~/.vim.local > /dev/null

# Configure AWS credentials
aws configure

# ECR Login
eval $(aws ecr get-login --no-include-email)

cd ~

# Clone Documents
git clone git@github.com:stephenfairchild/documents.git

# Clone Dotfiles
curl -o- https://raw.githubusercontent.com/stephenfairchild/Dotfiles/master/install.sh | bash

# Setup Git
git config --global user.email "stephen.fairchild@researchsquare.com"
git config --global user.name "Stephen Fairchild"


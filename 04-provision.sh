#! /usr/bin/sh

# TODO add a check to make sure the user is not root.
# TODO create /home/{user}/.local/share if it doesnt exist.
# TODO If not logged into last pass prompt to login.

# Set default shell to zsh
sudo chsh -s /bin/zsh $(whoami)

## Remove bash defaults
rm -rvf ~/.bashrc ~/.bash_history

## Remove existing SSH and .local if they exist
rm -rvf ~/.ssh
rm ~/.vim.local

## Setup new SSH files
mkdir -m700 -p ~/.ssh
touch ~/.ssh/id_rsa
touch ~/.ssh/id_rsa.pub
touch ~/.ssh/config

## Create SSH key files
lpass show ssh-private-key --notes --fixed-strings | tee ~/.ssh/id_rsa > /dev/null
lpass show ssh-public-key --notes --fixed-strings | tee ~/.ssh/id_rsa.pub > /dev/null

## Create SSH config file
lpass show ssh-config --notes --fixed-strings | tee ~/.ssh/config > /dev/null

## Set Permissions
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

## Create .vim.local
lpass show vim-local --notes --fixed-strings | tee ~/.vim.local > /dev/null

## Clone Documents
cd ~
git clone git@github.com:stephenfairchild/documents.git

## Install Dotfiles
curl -o- https://raw.githubusercontent.com/stephenfairchild/Dotfiles/master/install.sh | bash

## Setup Git
git config --global user.email "stephen.fairchild@researchsquare.com"
git config --global user.name "Stephen Fairchild"

# Copy in script files
chown stephen:stephen /usr/local/bin && cd /usr/local/bin
git clone git@github.com:stephenfairchild/usr-local-bin.git

## Configure AWS credentials
aws configure
eval $(aws ecr get-login --no-include-email)

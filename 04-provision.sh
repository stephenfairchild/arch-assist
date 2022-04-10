#! /usr/bin/sh

# This file uses the lastpass CLI to copy secrets onto a new machine. Secrets
# in this context are things like AWS keys, SSH private/public keypairs and
# the vim.local. All of this assumes that the lastpass secrets are in place.
#
# It also handles the AWS login.

# TODO add a check to make sure the user is not root.
# TODO create /home/{user}/.local/share if it doesnt exist.
# TODO If not logged into last pass prompt to login.
# TODO Warn about things that will be overwritten, AWS, SSH, vim.local

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

## Create the AWS secrets placeholder
#mkdir -m700 -p ~/.aws
#touch ~/.aws/credentials

## Create new system files based on the lastpass files
lpass show ssh-private-key --notes --fixed-strings | tee ~/.ssh/id_rsa > /dev/null
lpass show ssh-public-key --notes --fixed-strings | tee ~/.ssh/id_rsa.pub > /dev/null
lpass show ssh-config --notes --fixed-strings | tee ~/.ssh/config > /dev/null
lpass show vim-local --notes --fixed-strings | tee ~/.vim.local > /dev/null
#lpass show rs-aws-keys --notes --fixed-strings | tee ~/.aws/credentials > /dev/null

## Set Permissions
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

## Clone Documents
cd ~
git clone git@github.com:stephenfairchild/documents.git

## Install Dotfiles
curl -o- https://raw.githubusercontent.com/stephenfairchild/Dotfiles/master/install.sh | bash

# Copy in script files
chown stephen:stephen /usr/local/bin && cd /usr/local/bin
git clone git@github.com:stephenfairchild/usr-local-bin.git

# Install getnf for font management in Kitty
git clone https://github.com/ronniedroid/getnf
cd getnf
./install.sh



## Configure AWS credentials
#aws configure
#eval $(aws ecr get-login --no-include-email)

#! /usr/bin/sh

# Clone dotfiles
curl -o- https://raw.githubusercontent.com/stephenfairchild/Dotfiles/master/install.sh | bash

# Setup Git
git config --global user.email "stephen.fairchild@researchsquare.com"
git config --global user.name "Stephen Fairchild"

# Set default shell to zsh
sudo chsh -s /bin/zsh $(whoami)


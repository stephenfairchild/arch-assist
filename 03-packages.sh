#! /usr/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

if [ "$(id -u)" != "0" ]; then
    echo "Cannot setup system.  Must be root."
    exit 1
fi

# Install system packages
pacman -S --noconfirm --needed neovim git zsh wget tmux sed openssl openssh notification-daemon jq fzf dunst

# GUI + window server
pacman -S --noconfirm --needed xorg-server xorg-xinit xorg-xrandr

# Install graphics card driver
if $(lspci | grep "VGA.*Intel" >/dev/null 2>&1); then
  pacman -S --noconfirm libva-intel-driver xf86-video-intel
fi

# Desktop + Window environment
pacman -S --noconfirm --needed \
i3-gaps i3status i3lock \
dmenu feh \
powerline powerline-common powerline-fonts \
thunar

# Fonts
pacman -S --noconfirm --needed ttf-fira-code

# Browser
pacman -S --noconfirm --needed chromium

# Media
pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pulseaudio-bluetooth \
blueman bluez bluez-utils \
alsa-utils

# Languages
pacman -S --noconfirm --needed ruby rust nodejs python3 python2 perl go php

# Code completion support in Vim
pacman -S --noconfirm --needed python-neovim
# Link composer so it can be ran globally for vim completion
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
# cd into /phpactor vim plugins and run `composer install`

# Development
pacman -S --noconfirm --needed terminator tmate mariadb aws-cli diff-so-fancy prettier the_silver_searcher npm android-studio

# Docker
pacman -S --noconfirm --needed docker docker-compose
systemctl start docker
systemctl enable docker
usermod -a -G docker stephen

# Productivity
pacman -S --noconfirm --needed lastpass-cli htop netcat
#yay slack gyazo unzip playonlinux minecraft-launcher saw nvm brave package-query flux-gui polybar

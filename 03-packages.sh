#! /usr/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

if [ "$(id -u)" != "0" ]; then
    echo "Cannot setup system.  Must be root."
    exit 1
fi

# Install system packages
pacman -S --noconfirm --needed neovim git zsh wget tmux tmuxp sed openssl openssh notification-daemon jq fzf dunst starship fuse2 dateutils

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
pacman -S --noconfirm --needed ruby rustup nodejs python3 python2 perl go php

# Code completion support in Vim
pacman -S --noconfirm --needed python-neovim

# Development
pacman -S --noconfirm --needed kitty tmate mariadb aws-cli diff-so-fancy prettier the_silver_searcher npm

# Docker
pacman -S --noconfirm --needed docker docker-compose
systemctl start docker
systemctl enable docker
usermod -a -G docker stephen

# Productivity
pacman -S --noconfirm --needed lastpass-cli htop netcat

# Install fly for deployments
curl -L https://fly.io/install.sh | sh

rustup component add rls rust-analysis rust-src

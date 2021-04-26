#! /usr/bin/sh

# Safety settings
set -uo pipefail

# Error handling / debugging
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

# Setup logging
exec 1> >(tee "stdout.log")
exec 2> >(tee "stderr.log")

if [ "$(id -u)" != "0" ]; then
    echo "Cannot setup system.  Must be root."
    exit 1
fi

# Install system packages
pacman -S --noconfirm --needed neovim git zsh yay wget tmux sed package-query openssl openssh notification-daemon netctl jq fzf dunst curl

# Install graphics card driver
if $(lspci | grep "VGA.*Intel" >/dev/null 2>&1); then
  pacman -S --noconfirm libva-intel-driver xf86-video-intel
fi


# Desktop environment
pacman -S --noconfirm --needed i3-gaps i3status i3lock dmenu feh polybar \
powerline powerline-common powerline-fonts \
flux-gui
# Install fonts
#???

# Browser
pacman -S --noconfirm --needed brave

# Install media tools
pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pulseaudio-bluetooth \
blueman bluez bluez-utils \
alsa-utils

# Install programming languages
pacman -S --noconfirm --needed ruby rust nvm nodejs python3 python2 perl php8 go

# Install dev tools
pacman -S --noconfirm --needed terminator tmate saw mariadb aws-cli diff-so-fancy

# Install productivity tools
yay gyazo unzip thunar the_silver_searcher

# Install Gaming tool
pacman -S --noconfirm --needed playonlinux minecraft-launcher

# Install docker
pacman -S --noconfirm --needed docker
groupadd docker
[ -n "$USERNAME" ] && usermod -a -G docker $USERNAME
systemctl enable docker.service

# Import documents
git clone git@github.com:stephenfairchild/documents.git


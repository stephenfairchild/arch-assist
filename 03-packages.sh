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
pacman -S --noconfirm --needed neovim git zsh wget tmux sed openssl openssh notification-daemon jq fzf dunst

# X
pacman -S --noconfirm --needed xorg-server xorg-xinit

# Install graphics card driver
if $(lspci | grep "VGA.*Intel" >/dev/null 2>&1); then
  pacman -S --noconfirm libva-intel-driver xf86-video-intel
fi

# Desktop environment
pacman -S --noconfirm --needed \
i3-gaps i3status i3lock \
dmenu feh \
powerline powerline-common powerline-fonts


# Install package-query, flux-gui, polybar?
# Install yay?
# Install fonts?

# Browser
pacman -S --noconfirm --needed chromium
#pacman -S --noconfirm --needed brave

# Install media tools
pacman -S --noconfirm --needed pulseaudio pulseaudio-alsa pulseaudio-bluetooth \
blueman bluez bluez-utils \
alsa-utils

# Install programming languages
pacman -S --noconfirm --needed ruby rust nodejs python3 python2 perl go
# nvm??

# Install dev tools
pacman -S --noconfirm --needed terminator tmate mariadb aws-cli diff-so-fancy
## saw??

# Install productivity tools
#yay gyazo unzip thunar the_silver_searcher

# Install Gaming tool
#pacman -S --noconfirm --needed playonlinux minecraft-launcher

# Install docker
#pacman -S --noconfirm --needed docker
#groupadd docker
#[ -n "$USERNAME" ] && usermod -a -G docker $USERNAME
#systemctl enable docker.service

# Import documents
#git clone git@github.com:stephenfairchild/documents.git


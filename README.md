# System Playbook

This repository holds a set of commands to provision my daily driver.


I use Arch Linux (btw) and after years of use I've ended up with random config changes in random places that are impossible to track without a system like this in place. When the corporate big wigs ship me a new machine every 5 years those system settings get lost, or it takes me a year to get the machine to almost where it was. 

With this toolkit those days are long gone and I can now
spend my time doing way more valuable things like going through the Ansible docs to figure out how in the hell to provision `pacman` to run 
as root. All jokes aside this is a representation of my system state and it makes disasters easy to recover from and change welcome.


## Features

- Completely destroy HDD partitions and create new ones
- Install Arch Linux base kernel
- Automates the `chroot` commands needed to get off the Live CD
- Installs development tools and packages needed for graphics, etc.
- Idempotent package management and upgrades


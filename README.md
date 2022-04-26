# System Playbook

### On the host machine

#### Setup WiFi

1. Boot a machine with a USB that includes the Arch live image
2. Enter the interact prompt. `$ iwctl`
3. List all available WiFi devices: `$ device list`
4. Scan for networks: `$ station <device-name> scan` *(There will be no output)
5) Show available networks: `$ station <device-name> get-networks`
6) Connect to the network: `$ station <device-name> connect <network-name> 

#### Connect to host with SSH

1. Set a password on the host machine: `$ passwd`
2. Determine host machine Ip Address: `$ ip address` 
3. From the existing system machine you can now SSH into the host `$ ssh root@<ip-address>`


## Features

- Completely destroy HDD partitions and create new ones
- Install Arch Linux base kernel
- Automates the `chroot` commands needed to get off the Live CD
- Installs development tools and packages needed for graphics, etc.
- Idempotent package management and upgrades


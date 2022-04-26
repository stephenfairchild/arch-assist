# Germinate

Arch Linux is not hard to install. But there are a series of steps that need completed in succession with precision in order to get a working machine. This package automates that process and gives a repeatable install. Germinate takes care of paritioning the machine, installing the base packages, setting up pacman, the mirrors, user groups, etc.

### Download

```
curl -L -o germinate.tar.gz \
https://github.com/stephenfairchild/germinate/releases/download/latest/germinate.tar.gz
```

### Installation

Download and extract the tarball. Run the pre-install first and then the install.

### From SSH

It can be really helpful to have two machines. One that's on the live image, one that's a full system. 
In that scenario you can SSH into the new machine and run these commands. 

1. Boot a machine with a USB that includes the Arch live image (host machine)
2. Enter the interactive prompt. `$ iwctl`
3. List all available WiFi devices: `$ device list`
4. Scan for networks: `$ station <device-name> scan` *(There will be no output)
5. Show available networks: `$ station <device-name> get-networks`
6. Connect to the network: `$ station <device-name> connect <network-name> 
7. Set a password on the host machine: `$ passwd`
8. Determine host machine Ip Address: `$ ip address` 
9. From the existing system machine you can now SSH into the host `$ ssh root@<ip-address>`

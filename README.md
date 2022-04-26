# System Playbook

These scripts are meant to be ran when you're still on the Arch Linux live image. These get you _off_ of the
live image. 

Specifically, here's what it does:

- Completely destroy HDD partitions and create new ones (make sure you're backed up!)
- Install Arch Linux base kernel
- Automates the chroot commands needed to get off the Live CD

### Download

```
curl -L -o latest.tar.gz \
https://github.com/stephenfairchild/system-playbook/releases/download/v0.1.0/latest.tar.gz
```

### Installation

Download and extract the tarball. Run the pre-install first and then the install. The machine reboots after that and you should
can then remove your live USB.


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

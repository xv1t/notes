![](https://www.debian.org/logos/openlogo-nd-100.jpg)
# debian-notes
> 8.2 jessie

# install
Best way - install from dvd image [debian-8.2.0-amd64-DVD-1.iso](http://mirror.yandex.ru/debian-cd/8.2.0/amd64/iso-dvd/debian-8.2.0-amd64-DVD-1.iso) and choice your set of package in tasksel dialog such as: destkop type or without desktop for server mode. In the this dvd contains all required packages for this choices;

# Setup system
> after install

## Add sudo in system
```bash
su
#****** password

#install package
apt-get install sudo

#add your user account to group
usermod -G sudo "$USER_NAME"

#logout from session!
```

## Check timezone
```bash
sudo dpkg-reconfigure tzdata
```

## Console applications
```bash
sudo apt-get install "vim" "mc" "htop"
```

## nvidia
Edit /etc/apt/sources.list, and modify add ``contrib non-free`` for the repo options
```bash
deb http://mirror.yandex.ru/debian/ jessie main contrib non-free
```

```bash
sudo apt-get update && sudo apt-get install nvidia-glx nvidia-kernel-`uname -r` nvidia-kernel-dkms nvidia-settings nvidia-xconfig
```
Kill all X-sessions and in the terminal write
```bash
sudo nvidia-xconfig
reboot
```
[thanks link](http://www.linux.org.ru/forum/general/11802179?lastmod=1437795357513#comment-11802193)

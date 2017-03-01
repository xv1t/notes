# xubuntu-tuning
Remove locker
```bash
sudo apt-get remove light-locker
sudo apt-get install gnome-screensaver
```
Install audio plugin
```bash
sudo apt install xfce4-xkb-plugin
```
## minimal installation
### From netinst.iso
Download [mini.iso](https://help.ubuntu.com/community/Installation/MinimalCD#A64-bit_PC_.28amd64.2C_x86_64.29_.28Recommended.29). 
### lxc
After createing container, run:
```bash
sudo update
sudo upgrade
sudo apt install tasksel
```
Run
```bash
tasksel
```
And select a 
- [x] Xubuntu minimal installation

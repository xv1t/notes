# Install on realtek
Works from USB stick
## Prepare USB stick
On worked host with any virtual software: VirtualBox, ESXI, Vmware Workstation
1. Insert USB Stick
2. Create virtual machine with
3. Add USB device this stick
4. Download ESXI ISO file, for example 6.7 ver
5. Start virtual machine and install ESXI into USB Stick
7. After install shutdown virtual machine

## Add a driver file on the stick
1. Download a file driver https://storage.googleapis.com/files.stackattack.net/net55-r8168-8.039.01-napi.x86_64.vib https://blog.stackattack.net/2017/02/04/tp-link-tg-3468-and-vmware-esxi-6-5/
2. mount any USB partition FAT-16 from stick, or all
3. copy file `net55-r8168-8.039.01-napi.x86_64.vib` to partition (or all partitions in the root)
4. Umount USB stick.

## Install driver
1. Connect USB stick on your target host
2. Start boot ESXI on USB stick
3. <F2><LOGIN/PASSWORD>
  4. Troubleshoot Options
  5. Enable ESXi Shell
  6. Alt+<F1>
  7. <LOGIN/PASSWORD>
  8. cd `/vmfs/volumes`
  9. find file, for example, `find | grep net55`
  10. `cp ./65465465-cd425365-a0d6-cd088748363d/*.vib /tmp`
11. `esxcli software acceptance set –-level=CommunitySupported`
12. `esxcli software vib install -v /tmp/net55-r8168-8.039.01-napi.x86_64.vib`

Waiting a lot of time
1. Reboot
2. F2 <PASSWORD>
3. `Configure Management Network` -> `Network adapters` -> [x] on the `vmnic*`

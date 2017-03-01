# lxc.conf
## Mount host dir
###Readonly
```
lxc.mount.entry=/tmp mnt/tmp none bind,ro 0 0
```
###read write
```
lxc.mount.entry=/var/tmp mnt/tmp2 none bind 0 0
```

## Host Network configuration
Host network conf `/etc/network/interfaces`
```bash
auto lo
iface lo inet loopback

# The primary network interface

#LAN_IFACE
auto enp2s0
iface enp2s0 inet static

auto lanbr0
iface lanbr0 inet static
    address             10.0.0.4
    netmask             255.255.255.0
    bridge_ports        enp2s0
    bridge_fd           0

#WAN
auto enp3s0
iface enp3s0 inet manual

auto wanbr0
iface wanbr0 inet static
    address             172.16.11.4
    netmask             255.255.255.0
    dns-nameservers     172.16.11.1
    gateway             172.16.11.1
    bridge_ports        enp3s0
    bridge_fd           0
```
Bridges list:
```bash
sudo brctl show
bridge name bridge id           STP enabled  interfaces
lanbr0      8000.6cf04953642f   no           enp2s0
                                             veth5T5J1P
                                             veth5UAOEL
                                             veth8C0F8S
                                             vethIFFGN4
                                             vethOBK9GL
lxcbr0      8000.000000000000   no		
wanbr0      8000.00c026a6973b   no           enp3s0
                                             veth7F77HL
                                             vethT5RJU8
```
## Guests
###One interface 
```
lxc.network.type = veth
lxc.network.link = lanbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:b0:22:e3
lxc.network.ipv4 = 192.168.1.184/24
lxc.network.ipv4.gateway = 192.168.1.199
```
Inside lxc `etc/network/interfaces`
Only set `dns-nameservers`
```
auto eth0
iface eth0 inet manual
dns-nameservers 10.0.0.199
```
### Two interface
```
lxc.network.type=veth
lxc.network.link=lanbr0
#lxc.network.link=lxcbr0
lxc.network.flags=up
lxc.network.hwaddr= 00:16:3e:62:44:da

lxc.network.type=veth
lxc.network.link=wanbr0
lxc.network.flags=up
lxc.network.hwaddr= 00:16:3e:ae:d0:a6
lxc.network.name = eth1
```

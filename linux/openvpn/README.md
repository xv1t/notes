#OpenVPN
## Syncronyze time
On the server and clients
```
sudo ntpdate timeserver.ru
```
## Network interface (LXC guests)
On the server and the all clients check a device `/dev/net/tun`
```
mkdir /dev/net
mknod /dev/net/tun c 10 200
```
## Build keys
## Server Configuration
## Client configuration 
ccd

## Routes
## Testing networks

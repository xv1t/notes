![](https://openvpn.net/templates/telethra/img/ovpntech_logo-s.png)
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
## :key: Build keys
On server:
### Prepare key folder
```bash
# Make main dierctory
sudo mkdir /etc/openvpn/keys

# Link it to the easy-rsa tool directory 
ln -s /etc/openvpn/keys /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys

# Copy vars file
cp /usr/share/doc/openvpn/examples/easy-rsa/2.0/vars /etc/openvpn/
```
### Variables
Edit file `/etc/openvpn/vars`
```bash
export KEY_COUNTRY="RU"
export KEY_PROVINCE="63"
export KEY_CITY="Bahta"
export KEY_ORG="Bahta"
export KEY_EMAIL="admin@bahta.ru"
export KEY_CN=myhost
export KEY_NAME=myhost
export KEY_OU=myhost
```
### Generate server key files
```bash
cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/
./clean-all
source /etc/openvpn/vars
./build-dh
./build-ca
./build-key-server myvpnserver01
```
### Generate client keys
```bash
source /etc/openvpn/vars
cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/
./build-key client01
```

### Keys files
Example file listing `ls /etc/openvpn/keys/`
```
01.pem
02.pem
ca.crt
ca.key
dh1024.pem
index.txt
index.txt.attr
index.txt.attr.old
index.txt.old
client01.crt
client01.csr
client01.key
myvpnserver01.crt
myvpnserver01.csr
myvpnserver01.key
serial
serial.old
```

## Server Configuration
Example `/etc/openvpn/myserver.conf`
```
  dev tap0
 port 31194
proto udp


mode server

#ifconfig-pool 10.63.0.28 010.063.000.130
ifconfig      10.63.0.26 255.255.255.252
#server
tls-server


dh   keys2017/dh1024.pem
ca   keys2017/ca.crt
cert keys2017/proxy01.crt
key  keys2017/proxy01.key


 user nobody
group nogroup

comp-lzo
persist-tun
persist-key

keepalive 10 120

status "/var/log/openvpn/openvpn-status.log"
log "/var/log/openvpn/openvpn.log"
log-append "/var/log/openvpn/openvpn.log"
verb 4


#client-to-client

client-config-dir     /etc/openvpn/ccd/
####;;;ooooifconfig-pool-persist /etc/openvpn/vpn-ip.log

route 10.63.0.24   255.255.255.252  192.168.1.199

#== m20
#       net_id         net_mask
route 010.063.00.028  255.255.255.252  10.63.0.26
route 192.168.20.000  255.255.255.000  10.63.0.30

#=== all clients
push "route 10.63.0.24  255.255.255.252 "
push "route 192.168.1.0 255.255.255.0   10.63.0.26"
```
## Client configuration 
ccd

## Routes
## Testing networks

# Manual dns for dhcp client
```bash
sudo vi "/etc/dhcp/dhclient.conf"
```
add line
```
supersede domain-name-servers 8.8.8.8
```

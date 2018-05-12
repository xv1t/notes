# Zabbix agent
## Install
### Ubuntu

1. Download [official binary package](https://www.zabbix.com/ru/download?zabbix=3.4&os_distribution=ubuntu&os_version=xenial&db=MySQL) zabbix-release_****+xenial_all.deb
2. install `sudo dpkg -i zabbix-release_****+xenial_all.deb`
3. `sudo apt update`
4. `sudo apt install zabbix-agent`

#### Change file `/etc/zabbix/zabbix_agentd.conf`
```
#
```
#### Autostart agent service
```bash
sudo update-rc.d "zabbix-agent" "defaults"
```

#### Start agent service
```
sudo service zabbix-agent start
```

### Windows

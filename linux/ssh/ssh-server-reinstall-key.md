# Reinstall ssh host keys

```bash
sudo rm /etc/ssh/ssh_host_*
```

```bash
sudo dpkg-reconfigure "openssh-server"
```

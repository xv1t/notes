# mdadm.conf
After the change of the raid array, you need manually update `/etc/mdadm/mdadm.conf`
```bash
mdadm --detail --scan --verbose > /etc/mdadm/mdadm.conf
```

# rc.local

## 1. create unit file
`/etc/systemd/system/rc-local.service`
```ini
[Unit]
 Description=/etc/rc.local Compatibility
 ConditionPathExists=/etc/rc.local

[Service]
 Type=forking
 ExecStart=/etc/rc.local start
 TimeoutSec=0
 StandardOutput=tty
 RemainAfterExit=yes
 SysVStartPriority=99

[Install]
 WantedBy=multi-user.target
```

## 2. Create `/etc/rc.local`
```bash
touch "/etc/rc.local"
chmod 755 "/etc/rc.local"
```
Set content
```bash
#!/bin/sh -e
#
# rc.local
#


exit 0

```

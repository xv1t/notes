# Protect SSH sessions by keys

Firstly, generate ssh keys `ssh-keygen` and copy on the remote server `ssh-copy-id`

Copy `sshd_config` file to `sshd_config.29999`

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.29999
```

Edit `/etc/ssh/sshd_config.29999`
```
Port 29999

PasswordAuthentication no

PubkeyAuthentication yes
```

Edit `/etc/rc.local` add a line:

```
/usr/sbin/sshd -f /etc/ssh/sshd_config.29999
```
Reboot, and check running service on port 29999
```bash
sudo netstat -nlpt | grep sshd
tcp        0      0 0.0.0.0:29999           0.0.0.0:*               LISTEN      1937/sshd       
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1339/sshd       
tcp6       0      0 :::29999                :::*                    LISTEN      1937/sshd       
tcp6       0      0 :::22                   :::*                    LISTEN      1339/sshd
```

Test connecting:
```bash
ssh localhost -p 29999
```
Brave open port 29999 to the Internet and enjoy.

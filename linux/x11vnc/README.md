# Ubuntu 16 lightdm
```bash
x11vnc -storepassw /etc/lightdm/.vncpasswd
```
Write file `/etc/lightdm/lightdm.conf`
```ini
[SeatDefaults]                                                                                                            
  greeter-setup-script=/etc/lightdm/x11vnc.sh
```
Write script `/etc/lightdm/x11vnc.sh`
```bash
#!/bin/bash

VNC_PORT=29761

x11vnc -dontdisconnect \
	-display :0 \
	-auth /var/run/lightdm/root/:0 \
	-notruecolor -noxfixes -shared -forever \
	-rfbport $VNC_PORT -bg \
	-o /var/log/x11vnc.log \
	-rfbauth /etc/lightdm/.vncpasswd
```

Check port fo x11vnc
```bash
netstat -nlpt
Активные соединения с интернетом (only servers)
Proto Recv-Q Send-Q Local Address Foreign Address State       PID/Program name
tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN      867/dnsmasq     
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      826/sshd        
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      1749/cupsd      
tcp        0      0 0.0.0.0:29761           0.0.0.0:*               LISTEN      5244/x11vnc     
tcp6       0      0 :::29761                :::*                    LISTEN      5244/x11vnc     
tcp6       0      0 :::22                   :::*                    LISTEN      826/sshd        
tcp6       0      0 ::1:631                 :::*                    LISTEN      1749/cupsd      
tcp6       0      0 :::29761                :::*                    LISTEN      5244/x11vnc
```

Restart lightdm
```bash
service lightdm restart
```



# Auto start with DM session
Not working!
```bash
start on login-session-start
script
#x11vnc -storepasswd
x11vnc -dontdisconnect -display :0 -auth /var/run/lightdm/root/:0 -notruecolor -noxfixes -shared -forever -rfbport 5900 -bg -o /var/log/x11vnc.log -rfbauth /home/USER/.vnc/passwd
end script
```

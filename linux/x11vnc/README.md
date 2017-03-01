# Auto start with DM session

```bash
start on login-session-start
script
#x11vnc -storepasswd
x11vnc -dontdisconnect -display :0 -auth /var/run/lightdm/root/:0 -notruecolor -noxfixes -shared -forever -rfbport 5900 -bg -o /var/log/x11vnc.log -rfbauth /home/USER/.vnc/passwd
end script
```

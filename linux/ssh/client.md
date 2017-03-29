# Connect trougt SSH proxy
```bash
ssh  -o ProxyCommand='ssh -W %h:%p remote_server' administrator@192.168.0.9
```

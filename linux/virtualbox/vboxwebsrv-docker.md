# VBOX web srv

## VboxWebSrv settings
File `/etc/default/virtualbox` add a lines:
```bash
VBOXWEB_USER="vbox"
VBOXWEB_HOST="0.0.0.0"
```

Run this service as
```bash
/usr/lib/virtualbox/vboxweb-service.sh "start"
```

## Docker
Docker image selected is `joweisberg/phpvirtualbox` with support VirtualBox 6.*

For Virualbox 5.* use image `jazzdd/phpvirtualbox`

docker-compose.yaml
```yaml
version: "3.2"
services:
  vbox_http:
    image: joweisberg/phpvirtualbox
    restart: always
    ports:
      - 8088:80
    env_file:
      - .env
    environment:
      SRV1_HOSTPORT: "192.168.0.1:18083"
      SRV1_NAME: "vbox-host"
      #SRV1_USER: "vbox"
      #SRV1_PW: "VboXX-Pw2"
      CONF_browserRestrictFolders: "/mnt/net/syno01/downloads,/srv/data0/vbox,/srv/data1/vbox,/srv/data0/distr/iso"
```

`SRV1_USER` - real user account in the linux host

`SRV1_PW` - password of this account

`SRV1_HOSTPORT` - real IP address of linux host

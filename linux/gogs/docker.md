# Gogs in docker

Create directory `data`

Run cintainer with persistent data

Sample content of file `docker-compose.yml`
```yml
version: '3'

services:
  gogsweb:
    image: gogs/gogs
    networks:
      static-network:
        ipv4_address: 172.20.128.2
    ports:
      - "3000:3000"
      - "2222:22"
    volumes:
      - ./data:/data
        #custom logo icon
      - ./data/favicon.png:/app/gogs/public/img/favicon.png

networks:
  static-network:
    ipam:
      config:
        - subnet: 172.20.128.0/24

```

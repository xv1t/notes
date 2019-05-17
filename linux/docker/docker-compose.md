Start all

```
docker-compose up
```

Start and detach

```
docker-compose up -d
```

Attach to log

```bash
docker-compose "logs" -f
```

Attach to service `web` console
```bash
docker-compose exec "web" sh
```


Reconfig one service and restart it
```bash
# edit docker-compose.yml

# stop service
docker-compose stop "web"
docker-compose rm "web"
docker-compose up -d "web"

```

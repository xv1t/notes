# System privelegs
go to group `docker`

# Manage containers

## Connect to container
```bash
docker exec -i -t "container_name" bash
```

## List all containers

Running

```
docker ps
```

All

```
docker ps -a
```

All by `uid` list

```
docker ps -aq
```

## Run container
```
docker run -
```
options | comment                            | examples
---     |---                                 |---
-d      | Run to background -d(etached)      |
-it     | run in current TTY                 | `docker run -t "busybox" sh`
--rm    | Remove container after stop

## Stop comtainer

Stop all running containers
```
docker stop `docker ps -aq`
```

## Remove container
```
docker rm CONTAINER_NAME
```

Remove all containers
```
docker rm `docker ps aq`
```

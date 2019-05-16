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

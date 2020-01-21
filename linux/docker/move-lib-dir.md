# Change `/var/lib/docker`

New path, for example, `/new/path/docker`

## Edit file `/lib/systemd/system/docker.service`
Find

```ini
ExecStart=/usr/bin/docker daemon -H fd://
```

Change to
```ini
ExecStart=/usr/bin/docker daemon -g /new/path/docker -H fd://
```

## Stop
```sh
systemctl stop "docker"
```

```
systemctl daemon-reload
```


Copy old directoruy
```
mkdir -p "/new/path/docker"
rsync -aqxP "/var/lib/docker/" "/new/path/docker"
```

# Start
```sh
systemctl start "docker"
```


Source https://linuxconfig.org/how-to-move-docker-s-default-var-lib-docker-to-another-directory-on-ubuntu-debian-linux

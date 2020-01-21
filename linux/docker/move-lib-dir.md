# Change `/var/lib/docker`

New path, for example, `/new/path/docker`

## Edit file `/lib/systemd/system/docker.service`
Find

### Ubuntu 16.04
```ini
[Service]
ExecStart=/usr/bin/docker daemon -H fd://
```

Change to
```ini
[Service]
ExecStart=/usr/bin/docker daemon -g /new/path/docker -H fd://
```

### Ubuntu 18.04

find
```
[Service]
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```


```
[Service]
Type=notify
ExecStart=/usr/bin/dockerd -g /new/path/docker -H fd:// --containerd=/run/containerd/containerd.sock
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

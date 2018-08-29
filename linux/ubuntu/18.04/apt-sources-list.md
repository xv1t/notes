# `/etc/apt/sources.list`
## Default after install system
```
deb http://archive.ubuntu.com/ubuntu bionic main
deb http://archive.ubuntu.com/ubuntu bionic-security main
deb http://archive.ubuntu.com/ubuntu bionic-updates main
```
`universe` repo by default is not specified

## After modify
```bash
deb http://archive.ubuntu.com/ubuntu bionic main universe
#deb http://archive.ubuntu.com/ubuntu bionic-security main
deb http://archive.ubuntu.com/ubuntu bionic-updates main
```

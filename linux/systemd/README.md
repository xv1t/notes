# Service list

## List all services

```bash
systemctl "list-unit-files"
```

## List enabled

``` bash
systemctl "list-unit-files" | grep "enabled"
```

```bash
systemctl "list-unit-files" --state=enabled
```

## Status

```bash
systemctl "status" "application.service"
```

## List running

```bash
systemctl | grep "running"
```
# Service control

## Start/stop/reload

```bash
systemctl "start" "application.service"
```
or
```bash
systemctl "start" "application"
```

## enable/disable service

Add to autostart

```bash
systemctl "enable" "application.service"
```

Delete from autostart

```bash
sudo systemctl "disable" "application.service"
```

## Check service status

```bash
systemctl is-active application.service
systemctl is-enabled application.service
systemctl is-failed application.servic
```

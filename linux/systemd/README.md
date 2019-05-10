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

## List running

```bash
systemctl | grep "running"
```

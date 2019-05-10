# Service list

## List all services

```bash
systemctl "list-unit-files"
```

## List enabled

``` bash
systemctl "list-unit-files" | grep "enabled"
```

## List running

```bash
systemctl | grep "running"
```

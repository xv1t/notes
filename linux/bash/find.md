# find
## Find files by owner
```bash
find -type "f" -user "user1" -perm -u+rwx
```

## By date
All files created by 2 day old or newer
```bash
find -type "f" -mtime "-2"
```

Find older files then week (7 days)
```bash
find -type "f" -mtime "+7"
```

## Invert results
```bash
find -type "f" ! -iname "myfiles*"
```

## :warning: Delete all finding files
```bash
find -type "f" -iname "trash*" -delete
```

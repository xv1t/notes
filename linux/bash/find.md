# find
## Find files by owner
```bash
find -type "f" -user "user1" -perm -u+rwx
```

## By date
All files created by 2 day old or newer. Use `-mtime` option
```bash
find -type "f" -mtime "-2"
```

Find older files then week (7 days)
```bash
find -type "f" -mtime "+7"
```

## Invert results
Use `!` before option
```bash
find -type "f" ! -iname "myfiles*"
```

## Show results like `ls`
Use `-ls` option
```bash
find -type f -iname "lib*" -ls
```

## :warning: Delete all finding files
Use `-delete` option
```bash
find -type "f" -iname "trash*" -delete
```


--------
### links
1. https://losst.ru/komanda-find-v-linux

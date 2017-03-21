# bash
1. http://rus-linux.net/MyLDP/BOOKS/abs-guide/flat/abs-book.html
2. https://github.com/awesome-lists/awesome-bash
## Multiline
```bash
tar  \
  xvfz \
  "File.tar.gz" 
```

## inline comments
```bash
ssh                                         \
  "root@localhost" `#account name`           \
  -L 10080:localhost:80 `# localport porward` \
  -C `#compress connection`
```

## Pipes with multiline
```bash
tar c .               \
| tee "/srv/local.tar" \
| ssh "user@remotehost" "cat > /srv/data/backup/file.tar"
```

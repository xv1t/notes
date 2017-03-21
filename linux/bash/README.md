# bash
## Multiline
```bash
tar  \
  xvfz \
  "File.tar.gz" 
```

## inline comments
```bash
ssh \
  "root@localhost" `#account name` \
  -L 10080:localhost:80 `# localport porward` \
  -C `#compress connection`
```

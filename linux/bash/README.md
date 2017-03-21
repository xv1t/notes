# bash
1. http://rus-linux.net/MyLDP/BOOKS/abs-guide/flat/abs-book.html
2. https://github.com/awesome-lists/awesome-bash
## Multiline
Add a `\` symbol on end of line and procedd on next line
```bash
scanimage                               \
      --batch-start "1"                  \
      --mode "Color"                      \
      --progress                           \
       -x "198mm" -y "283mm" -l "1mm"       \
      --format "tiff"                        \
      --resolution "300"                      \
      --contrast "10"                          \
      --batch=$(date +%Y%m%d_%H%M%S)_p%04d.tiff \
      --batch-promp
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
## Arrays
https://habrahabr.ru/sandbox/102954/

Declare
```bash
declare -A users;
```
### Input data
```bash
users[user1]="Password123"
users[manager]="Password1233"
users[finance]="HtggFDt54364"
```
### Cycling items
```bash
for user in "${!users[@]}"; do
      password=${users[$user]}
done;
```

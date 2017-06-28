# Download file from WebDAV
With password prompt
```bash
curl -o "dlink620.txt"  "https://webdav.yandex.ru/folder/dlink620.txt" --user "username"
Enter host password for user 'username': ******
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    97  100    97    0     0    154      0 --:--:-- --:--:-- --:--:--   154
```
Without password prompt
```bash
curl -o "dlink620.txt"  "https://webdav.yandex.ru/folder/dlink620.txt" --user "username:password"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    97  100    97    0     0    154      0 --:--:-- --:--:-- --:--:--   154
```

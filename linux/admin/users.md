# Users administration
## Add user
Fast
```bash
adduser "newuser"
```
## Change user groups
Only one group
```bash
usermod -G "developers" "user1" 
```

Only set grou list
```bash
usermod -G "admins,ftp,www,developers" "user"
```
## Add user to group(s)
```bash
usermod -a -G "backup" "user1"
```
```bash
gpasswd -a "user1" "backup"
```
## Remove user from group
```bash
gpasswd -d "user1" "backup"
```

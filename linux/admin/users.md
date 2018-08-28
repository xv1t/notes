# Users administration
## Add user
Fast
```bash
adduser "newuser"
```

```bash
useradd "testuser" \
  --home-dir "/home/testuser" \
  --create-home
```

Create in the custom group
```bash
useradd "testuser" \
  --home-dir "/home/testuser" \
  --create-home \
  -g "users" \
  -N `#do not create group with username`
  
```

## Remove user account from system
```bash
userdel "username"
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
## Apply group
```bash
newgrp GROUP_NAME
```

# Users administration
## Add user
Fast
```bash
adduser "newuser"
```
## Change user groups
Only one group
```
usermod -G developers user1 
```

Only set grou list
```bash
usermod -G "admins,ftp,www,developers" "user"
```

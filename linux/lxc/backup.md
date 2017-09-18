# backup lxc directory
Typical lxc folder
```
-rw-r--r--  1 root root  556 дек  5  2015 config
-rw-r--r--  1 root root    0 дек  5  2015 fstab
drwxr-xr-x 22 root root 4096 сен 18 16:13 rootfs
```
Separate data:
1. Virtual machine files
2. User files
3. System files (databases)

## 1. Virtual machine files
tar

## 2. User files
Rsync with backup options

## 3. System files
Special backup scripts

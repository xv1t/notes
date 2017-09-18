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
All folders withous user data `/srv`
```
drwxr-xr-x  2 root root  4096 май 23  2016 bin
drwxr-xr-x  2 root root  4096 апр 11  2014 boot
drwxr-xr-x  3 root root  4096 май 21  2016 build
drwxr-xr-x  4 root root  4096 июн 12  2016 dev
drwxr-xr-x 82 root root  4096 сен 18 20:01 etc
drwxr-xr-x 12 root root  4096 май 23  2016 lib
drwxr-xr-x  2 root root  4096 сен  6  2016 lib64
drwxr-xr-x  2 root root  4096 апр 16  2015 media
drwxr-xr-x  2 root root  4096 апр 11  2014 mnt
drwxr-xr-x  2 root root  4096 апр 16  2015 opt
drwxr-xr-x  2 root root  4096 апр 11  2014 proc
drwx------  7 root root  4096 окт 19  2016 root
drwxr-xr-x  8 root root  4096 дек  5  2015 run
drwxr-xr-x  2 root root  4096 сен 13  2016 sbin
drwxr-xr-x  2 root root  4096 мар 13  2014 sys
drwxrwxrwt  6 root root 28672 сен 18 20:01 tmp
drwxr-xr-x 10 root root  4096 апр 16  2015 usr
drwxr-xr-x 12 root root  4096 дек  5  2015 var
```
tar

## 2. User files
Rsync with backup options,
folder such as `/srv`, `/home`
```
drwxr-xr-x  3 root root  4096 дек  5  2015 home
drwxr-xr-x  2 root root  4096 апр 16  2015 srv
```

## 3. System files
Special backup scripts

http://www.odmin4eg.ru/2010/korzina-samba-recycle-bin-at-samba/


```ini
#/etc/samba/recycle.conf
##Recycle Bin Configuration File##
repository = .recycle/%U
mode = KEEP_DIRECTORIES|VERSIONS|TOUCH
maxsize = 0
exclude = *.tmp|*.temp|*.o|*.obj|~$*|*.~??|*.trace
excludedir = /tmp|/temp|/cache
noversions = *.doc|*.ppt|*.dat|*.ini
keeptree = Yes
versions = Yes
```

In the share section
```ini
vfs object = recycle
config-file = /etc/samba/recycle.conf
```

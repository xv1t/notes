# smb.conf
Links
https://www.samba.org/samba/docs/using_samba/ch06.html#samba2-CHP-6-TABLE-2

## Reload configuration
```bash 
# Ubuntu Server
/etc/init.d/samba force-reload
```

## Public share

Create directory `/srv/samba/public`
```bash
mkdir -p "/srv/samba/public"
chown noboby:sambashare "/srv/samba/public"
chmod 777 "/srv/samba/public"
```

Section in `smb.conf`
```ini
[public]
  path            = /srv/samba/public
  guest ok        = yes
  read only       = no
  writable        = yes
  force user      = nobody
  force group     = sambashare
  create mask     = 775
  directory mask  = 775
```


## Recycle
`%S` - Sharename

`%u` - username

`%m` - user machine hostname

```ini
[LTech]
  path = /srv/sambashare/LTech
  write list = @LTechE @"Domain Admins" user1 user2
  read list  = @LTechV
  force user = nobody
  force group = nogroup
  create mask = 775
  directory mask = 775
  vfs object              = recycle
  recycle:repository      = /srv/sambashare/recycle/LTech/%S-%u@%m
  recycle:keeptree        = Yes
  recycle:touch           = Yes
  recycle:touch_mtime     = Yes
  recycle:version         = Yes
  recycle:directory_mode  = 0775
  recycle:subdir_mode     = 0775    
  recycle:versions        = Yes
  recycle:minsize         = 1
```

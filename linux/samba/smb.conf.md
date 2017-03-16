# smb.conf
## Recycle
```ini
[LTech]
  path = /srv/sambashare/LTech
  write list = @LTechE @"Domain Admins" taganinany hrustalevasa
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

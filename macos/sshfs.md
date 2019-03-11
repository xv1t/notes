# Mount sshfs
```bash
#!/bin/bash

sshfs ioweb01:/var/www/iodoc/app \
     iodoc -o reconnect,auto_cache,defer_permissions,noappledouble,Compression=no \
      -ovolname=WEB05/iodoc
```

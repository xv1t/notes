# Public share

create directory `/srv/pub` and add a `rwx` to other
```bash
mkdir "/srv/pub"
chmod o=rwx "/srv/pub"
```

Minimal

```ini
# section in smb.conf
[pub]
path = /srv/pub
public = yes
read only = no
```

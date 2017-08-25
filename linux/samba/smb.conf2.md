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
path           = /srv/pub
public         = yes
read only      = no
force group    = sambashare
create mask    = 0775
directory mask = 0775
```

For guests default all new files and directories was owned by `nobody:sambashare` with default create mask `0755`.
For login users, user own of created file or folder was `username`.

# Group access

All new files and folders mark owned by self.

Share name | path       | write group | read only group
-----------|------------|------------ |-----------------
libs       | `/srv/libs`  |`srv_libs`   | `srv_libs_r`

Create needed groups:
```bash
groupadd "srv_libs";
groupadd "srv_libs_r";
```

Permission for `/srv/libs`
```bash
chgrp srv_libs "/srv/libs"
chmod 775 "/srv/libs"
```

```ini
[libs]
path           = /srv/libs
write list     = @srv_libs
read list      = @srv_libs_r
read only      = no
force group    = srv_libs
create mask    = 775
directory mask = 0775
```

# Add user
Unix account
```bash
adduser "user1"
```
Samba account
```bash
smbpasswd -a user1
New password: ******
```

# Add group
```bash
groupadd "new_samba_server_group"
```

# Add user to group
```bash
gpasswd -a "user1" "group1"
```

# Remove user from group
```bash
gpasswd -d "user1" "group1"
```

# Show members of group
install packages `members`
```bash
members "group_name"
```

# Show user groups
```bash
groups "user1"
```
# Reboot samba service
Softly
```bash
service "smbd" restart;
service "nmbd" restart;
```
Hardly
```bash
reboot
```


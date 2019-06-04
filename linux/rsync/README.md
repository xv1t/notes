![](https://rsync.samba.org/newrsynclogo.jpg)
# RSync
## SSH protocol
```bash
LOCAL_SRC="/srv/data/arch/photo"
REMOTE_DST="/srv/data0/backup10/picasa/mirror"

#login
REMOTE="backup@server"
BACKUP_DIR="/srv/data0/backup10/picasa/history/`date +%Y/%m/%d`"

time      \
rsync      \
  -a -v -h  \
  -e ssh     \
  --delete    \
  --progress   \
  $LOCAL_SRC $REMOTE:$REMOTE_DST     \
  --exclude-from=$LOCAL_SRC/.exclude  \
  --delete-excluded	--delete-after \
  --backup --backup-dir=$BACKUP_DIR    

```

## Rsync protocol
### RSYNC server [backup storage]
`/etc/rsyncd.conf`
```ini
#global options
	pid file = /var/run/rsyncd.pid
	log file = /var/log/rsyncd.log
	transfer logging = true
	munge symlinks = yes

# папка источник для бэкапа
[data0]
	path = /srv/data0/backup/rsync/
	uid = root
	read only = no
	write only = yes
	list = yes
	comment = Data backup Dir
	auth users = backup
	secrets file = /etc/rsyncd.scrt
```
`/etc/rsyncd.scrt`, file mode `0600`
```
backup:12345678
```
Set in file `/etc/default/rsync`
```bash
RSYNC_ENABLE=true
```
Start service
```bash
service start rsync
```
### Rsync client with data source
```bash
#client
SRC="/srv/data0/home/xvit/"
DST="backup@meta11/data0/ltex01/home/current/"
       BACKUP_DIR="/ltex01/home/backup/`date +%Y-%m-%d`/"

time \
rsync \
	-avv                        \
	--progress                   \
	--delete                      \
	--delete-excluded              \
	--delete-after                  \
	--exclude-from=$HOME/.exclude    \
	--backup --backup-dir=$BACKUP_DIR \
	--password-file=$HOME/.rsync.pass  \
	$SRC rsync://$DST
```
`$HOME/.rsync.pass`, file mode `0600`
```
12345678
```

# links

https://www.alexeykopytko.com/2017/rsync-howto/

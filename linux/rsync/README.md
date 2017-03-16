# RSync
Example 1
```bash
LOCAL_SRC="/srv/data/arch/photo"
REMOTE_DST="/srv/data0/backup10/picasa/mirror"

#login
REMOTE="backup@server"
BACKUP_DIR="/srv/data0/backup10/picasa/history/`date +%Y/%m/%d`"

time   \
rsync   \
  $LOCAL_SRC $REMOTE:$REMOTE_DST    \
  --exclude-from=$LOCAL_SRC/.exclude \
	--delete-excluded	--delete-after    \
	--backup --backup-dir=$BACKUP_DIR    \
  -a -v -h  \
	-e ssh     \
  --delete    \
	--progress
```



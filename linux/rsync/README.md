# RSync
Example 1
```bash
LOCAL_SRC="/srv/data/arch/photo"
REMOTE_DST="/srv/data0/backup10/picasa/mirror"

#login
REMOTE="backup@server"

time   \
rsync   \
  $LOCAL_SRC $REMOTE:$REMOTE_DST    \
  --exclude-from=$LOCAL_SRC/.exclude \
	--delete-excluded	--delete-after    \
  -a -v -h  \
	-e ssh     \
  --delete    \
	--progress
```

#Backuping
## Directory to tar
Simple
```bash
cd "/srv/data/directory"

#without comptression
tar cf "/srv/data/backup.tar" .

# with gzip compression
tar cfz "/srv/data/backup.tar.gz" .
```
Via pipes
```bash
cd "/srv/data/directory"
tar c . > "/srv/data/backup.tar"

#with gzip

tar c | gzip > "/srv/data/backup.tar"
```

Double archiving: local and send to ssh
```bash
tar cz . \
| tee "/srv/data/backup.tar.gz" \
| ssh "login@sshserver" \
  "cat > /srv/backup/mybackup.tar.gz"
```
## Check avialable of remote ssh host
```bash
if ssh me@host.com true; then
  echo "Connect is ok"
else
  echo "connection failed"
fi
```

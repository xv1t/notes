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
tar cz . | tee "/srv/data/backup.tar.gz" | ssh "login@sshserver" "cat > /srv/backup/mybackup.tar.gz"
```

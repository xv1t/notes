# Copy file 

```bash
REMOTE_FTP_HOST=
REMOTE_FTP_USER=
REMOTE_FTP_PASSWORD=
LOCAL_DST_DIR=
dst_file=
REMOTE_FTP_DST_DIR=

ftp -n $REMOTE_FTP_HOST << FTP_SCRIPT
user $REMOTE_FTP_USER $REMOTE_FTP_PASSWORD
cd $REMOTE_FTP_DST_DIR
pwd
put $LOCAL_DST_DIR/$dst_file $REMOTE_FTP_DST_DIR/$dst_file
ls $REMOTE_FTP_DST_DIR/$dst_file
by
FTP_SCRIPT
```
# Copy from pipe
in the FTP script
```
put "| (cd /srv/data0/tmp; tar c . | tee /tmp/myfile.tar.gz | gzip) " test1.tar.gz
```
# Auto login
`~/.netrc` with `chmod 600`
```
machine remotehost.org login username password Pas$%335fd
```

# Incremental backup
rsync + tar
Source dir - `$SRC`

## Make incremental index file
Initialize fake archiving in the `/dev/null` for generation index file.
```bash
cd $SRC
tar c .. -g /tmp/index.tar.inc > /dev/null
```
It's quickly! For example, `327G` in the `$SRC` with over `1000000` files scans as `0m12s` and index size about `15M`.

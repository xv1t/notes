# Add a signature for bad attaches
Bad infected attachments:
1. JS scripts in the ZIP files
2. CMD script in the ZIP files
and more...

1. Write file [/var/lib/clamav/rules_attachment_block.cdb](https://github.com/xv1t/notes/blob/master/linux/mail/clamav/rules_attachment_block.cdb)
2. Restart clamav-daemon
```bash
service restart "clamav-daemon"
```

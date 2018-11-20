# Add a signature for bad attaches
Bad infected attachments:
1. JS scripts in the ZIP files
2. CMD script in the ZIP files

and more...

1. Write file [/var/lib/clamav/rules_attachment_block.cdb](https://github.com/xv1t/notes/blob/master/linux/mail/clamav/rules_attachment_block.cdb)
2. Restart clamav-daemon
```bash
service "clamav-daemon" restart
```

example mail.log with `status=VIRUS`
```
Nov 20 13:19:32 mail clamsmtpd: 1308A0: from=info@coach-us.de, to=latipov.d@rain.ru, status=VIRUS:rules_block_Zip_js.UNOFFICIAL
Nov 20 13:23:34 mail clamsmtpd: 1308D2: from=alex@alexproehl.com, to=musagotova.f@rain.ru, status=VIRUS:rules_block_Zip_js.UNOFFICIAL
Nov 20 13:24:50 mail clamsmtpd: 1308DB: from=jamie@thehighcam.com, to=vetrova.v@rain.ru, status=VIRUS:rules_block_Zip_js.UNOFFICIAL
```

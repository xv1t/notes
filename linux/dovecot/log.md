# Logging

Separate dovecot logs from syslog

## conf.d/10-logging.conf
```ini
log_path = /var/log/dovecot.log
info_log_path = /var/log/dovecot-info.log
debug_log_path = /var/log/dovecot-debug.log

syslog_facility = local5
```
## rsyslog.d/dovecot.conf
```bash
local5.* -/var/log/dovecot.log
local5.info -/var/log/dovecot.info
local5.warn -/var/log/dovecot.warn
local5.err -/var/log/dovecot.err
:msg,contains,"stored mail into mailbox"\
      -/var/log/dovecot.lmtp
```
## rsyslogs.d/50-default.conf
```bash
# add `mail.none`
*.*;auth,authpriv.none,mail.none                -/var/log/syslog

mail.info                       -/var/log/mail.info
mail.warn                       -/var/log/mail.warn
mail.err                        /var/log/mail.err
####------------- cut
```
## /etc/logrotate.d/dovecot
```
/var/log/dovecot*.log
{
        rotate 14
        missingok
        notifempty
        compress
        delaycompress
        postrotate
          doveadm log reopen
        endscript
        daily
}
```

# Restart 
```bash
dovecot reload
service rsyslog restart
```

#CRON

Edit tasks in the default editor
```bash
crontab -e
```

Change text editor type `select-editor`
```bash
Select an editor.  To change later, run 'select-editor'.
  1. /bin/ed
  2. /bin/nano        <---- easiest
  3. /usr/bin/mcedit
  4. /usr/bin/vim.basic
  5. /usr/bin/vim.tiny
```

After change save file and exit
```
crontab: installing new crontab
```

##Examples


Minute |  Hour  |  Day of month |   Month | Day of week |     command | Comment
-------|--------|---------------|---------|-------------|-------------|-------------------
*      |  *     |       *       |   *     |       *     |    ps       | Every minutes    
59     |  0     |       *       |   *     |   1-5       |    backup   |              
59     |  */3   |       *       |   */2   |    *        |    backup   | Every third hour, every second day


Crontab task file saved in `/var/spool/cron/crontabs/root` for user `root`. For user cronber, was `/var/spool/cron/crontabs/cronber`. Cron tasks runs under the own user rights.

## fast view on the tasks file
```bash
crontab -l
```

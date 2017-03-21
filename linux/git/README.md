![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/512px-Git-logo.svg.png)
# Deploy through git repo
File in the bare repo `/git/iodoc.git/hooks/post-receive`
```bash
#!/bin/sh

LOCAL_PATH="/var/www/iodoc/app"

echo "Update files: $LOCAL_PATH"
ssh ubuntu@ioweb01 "cd $LOCAL_PATH; git pull origin master; date +'%Y-%m-%d %H:%M:%S' > /var/www/iodoc/tmp/logs/last.commit.log";
```

After the any `git push` server run trigger script `/git/iodoc.git/hooks/post-receive`

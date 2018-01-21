# Client auto login
create file `~/.my.cnf`
```ini
[client]
user="dbuser"
password="Psf$#543"
database="mydb1"
```

And run
```bash
mysql -hserver2
```
without logn/password prompt

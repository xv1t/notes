# Send emails from mikrotik

Prepare mail account and server settings

```bash
/tool e-mail set          \
    address=smtp.yandex.ru \
    from=mikrotik@yandex.ru \
    password=Password2019    \
    port=587                  \
    start-tls=yes              \
    user=mikrotik@yandex.ru
```
## Test message
```bash
/tool e-mail send to=admin@yandex.ru subject="Test message subject"
```

## Netwatch example
```bash
/tool netwatch add \
    comment="11.22.33.44 watch" \
    down-script="/tool e-mail send to=admin@yandex.ru subject=\"11.22.33.44 down :(\"" \
    host=11.22.33.44 \
    up-script="/tool e-mail send to=admin@yandex.ru subject=\"11.22.33.44 up :)\""
```

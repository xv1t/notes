online testing [regexp](https://regex101.com/)

## Docs

1. https://dev.mysql.com/doc/refman/5.5/en/regexp.html
2. https://postgrespro.ru/docs/postgrespro/9.5/functions-matching#functions-similarto-regexp
3. https://habr.com/ru/company/badoo/blog/343310/

# Any symbol `.*`
```regexp
.*
```
# Start `^`
```regexp
^startword
```

# end of string `$`
```regexp
ending$
```

# Find filter example
1. start `info`
2. email symbol `@`
3. ending on `.net`

string array
```
mail@mx.net
mail2@mkjd.net.ty
info@gmail.com.ty
info-map@server.one.net
network@by.me
crop@info.ne
info-2234@mail.vd
info763@makler.net
infoz@back.mi
net-info@gost.fR
```
rule
```regexp
^info.*@.*\.net$
```

result 
```
info-map@server.one.net
info763@makler.net
```
# invert 
Select all, but not `.ru` and `.com`
```regexp
/^(?:(?!(\.(ru|com))$).)+$/
```
strings
```
mail@com.ru
meta@moltex.com
userfdg@gmail.com
info@don.com
curabier@nord.nl
more@bork.net
```
result
```
curabier@nord.nl
more@bork.net
```

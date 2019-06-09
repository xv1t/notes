# Show sessions
```
quser
```

Renote
```
quser /server 192.168.0.100
```

```
qwinsta
```

```
query session
query session /counter
```
# Manage sessions
```
rwinsta
Сброс значений подсистем оборудования и программ сеанса в начальное состояние.

RESET SESSION {sessionname | sessionid} [/SERVER:servername] [/V]

  sessionname         Задает имя сеанса.
  sessionid           Задает сеанс с идентификатором ID.
  /SERVER:<сервер>    Сервер терминалов (по умолчанию текущий).
  /V                  Вывод подробной информации.
```

# close session
Logoff session width `ID` = `2`
```
logoff 2
```
Remote
```
logoff 2 /server 192.168.0.100
```

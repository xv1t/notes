# Connect trougt SSH proxy

```
                       _______
                      |       |         |-----|
INTERNET ------------ | SSH1  | --------| LAN |
                      |_______|         |_____|
                                               \
                                                \ _____________
                                                 | 192.168.0.9 |
                                                 --------------|

```

```bash
ssh  -o ProxyCommand='ssh -W %h:%p SSH1' administrator@192.168.0.9
```

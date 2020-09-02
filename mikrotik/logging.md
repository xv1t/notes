Disable logging `dhcp` messages

```bash
/system logging print
```

```bash
Flags: X - disabled, I - invalid, * - default 
 #    TOPICS                                                            ACTION                                                            PREFIX    
 0  * info                                                              memory                                                                      
      !dhcp                                                            
 1  * error                                                             memory                                                                      
 2  * warning                                                           memory                                                                      
      !dhcp                                                            
 3  * critical                                                          echo     
```

```
/system logging export
```

```bash
# sep/02/2017 09:06:45 by RouterOS 6.36.5
# software id = 
#
# model = RouterBOARD
# serial number = 
/system logging
set 0 topics=info,!dhcp
set 2 topics=warning,!dhcp
```

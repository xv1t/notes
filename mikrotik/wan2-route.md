#WAN2 route

WAN interfaces
1. pppoe-out1 - WAN1
2. pppoe-out2 - WAN2

Add a `/ip firewall address-list` name `WAN2_Clients` and put IP hosts from LAN
```bash
/ip firewall address-list> print where list=WAN2_Clients 
Flags: X - disabled, D - dynamic 
 #   LIST                                     ADDRESS                                                      CREATION-TIME        TIMEOUT             
 0   WAN2_Clients                             10.0.0.208                                                   dec/19/2019 11:49:03
 1   WAN2_Clients                             10.0.0.142                                                   dec/25/2019 21:58:30
```

Add a BOGON address list with a grey networks pools
```bash
/ip firewall> address-list print where list =BOGON 
Flags: X - disabled, D - dynamic 
 #   LIST                                     ADDRESS                                                      CREATION-TIME        TIMEOUT             
 0   BOGON                                    10.0.0.0/8                                                   dec/25/2019 22:02:01
 1   BOGON                                    192.168.0.0/16                                               dec/25/2019 22:02:24
 2   BOGON                                    172.16.0.0/16                                                dec/25/2019 22:02:43
```

Add mangle rule
```
/ip firewall mangle add
  chain=prerouting action=mark-routing new-routing-mark=wan2 passthrough=yes src-address-list=WAN2_Clients dst-address-list=!BOGON log=no 
      log-prefix=""
```

Add nat rule *firstly*
```bash
/ip firewall nat
  chain=srcnat action=masquerade out-interface=pppoe-out2 log=no log-prefix="" 
```

Add routes
```bash
/ip route 
add distance=1 gateway=pppoe-out2 routing-mark=wan2
add distance=1 gateway=pppoe-out1
```

Add rules each for LAN IP address
```
/ip route rule
0   ;;; test WAN2
     src-address=10.0.0.208/32 action=lookup table=wan2 

 1   ;;; Manual to WAN2
     src-address=10.0.0.142/32 action=lookup table=wan2 
```

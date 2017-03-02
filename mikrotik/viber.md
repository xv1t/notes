#Viber traffic separation

Add server address list
```bash
/ip firewall address-list
  add address=app.adjust.com list=ViberHosts
  add address=content.cdn.viber.com list=ViberHosts
  add address=www.viber.com.edgekey.net list=ViberHosts
  add address=www.cdn.viber.com list=ViberHosts
  add address=e9413.g.akamaiedge.net list=ViberHosts
  add address=aloha.viber.com list=ViberHosts
  add address=share.viber.com list=ViberHosts
  add address=share.media.aws.viber.com list=ViberHosts
  add address=dl-media.viber.com list=ViberHosts
```

Add address group `Filtration1` of devices for only viber access
```
/ip firewall address-list
  add address=192.168.1.78 list=Filtration1
```

Add forward rule
```bash
/ip firewall filter
  add action=accept chain=forward dst-port=5242,4244,5243,9785 protocol=tcp src-address-list=Filtration1
  add action=accept chain=forward dst-address-list=ViberHosts src-address-list=Filtration1
  add action=reject chain=forward reject-with=icmp-network-unreachable src-address-list=Filtration1
```

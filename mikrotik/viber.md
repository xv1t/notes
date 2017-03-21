# Viber traffic separation

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
add address=account.viber.com list=ViberHosts
add address=ads.viber.com disabled=yes list=ViberHosts
add address=update.viber.com list=ViberHosts
add address=media-direct.cdn.viber.com list=OnlyViber
add address=market-api.cdn.viber.com list=ViberHosts
add address=market.api.viber.com list=ViberHosts
add address=pg.cdn.viber.com list=ViberHosts
add address=support.viber.com list=ViberHosts
add address=viber.desk.com list=ViberHosts
add address=vibes.viber.com list=ViberHosts
add address=vbd.cdn.viber.com list=ViberHosts
add address=share.cdn.viber.com list=ViberHosts
add address=market.viber.com list=ViberHosts
add address=ptt.viber.com list=ViberHosts
add address=pg-vb.cdn.viber.com list=ViberHosts
add address=voipnina.com list=ViberHosts
```

Add address group `Filtration1` of devices for only viber access
```
/ip firewall address-list
  add address=192.168.1.78 list=Filtration1
```

Add forward rule
```bash
/ip firewall filter
  add action=accept chain=forward comment=Viber dst-port=5242,4244 protocol=tcp src-address-list=Filtration1
  add action=accept chain=forward dst-port=5243,7985,7987 protocol=udp  src-address-list=Filtration1
  add action=accept chain=forward dst-address-list=ViberHosts src-address-list=Filtration1
  add action=reject chain=forward reject-with=icmp-network-unreachable src-address-list=Filtration1
```

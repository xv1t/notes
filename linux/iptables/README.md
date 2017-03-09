# iptables
## Reset all rules
```bash
for table in "nat" "filter" "mangle"; do
  iptables -t $table -F
  iptables -t $table -X
done
```
## Variables idioms
```bash
IPTABLES="/sbin/iptables"
IP="ip"
ROUTE="route"
##=============================
POSTROUTING="$IPTABLES -t nat -A POSTROUTING"
PREROUTING="$IPTABLES -t nat -A PREROUTING"
FORWARD="$IPTABLES -t filter -A FORWARD"
MANGLE="$IPTABLES -t mangle"
SNAT="-j SNAT --to"
DNAT="-j DNAT --to"
TCP="-p tcp"
UDP="-p udp"
ICMP="-p icmp"
DPORT="--dport"
SPORT="--sport"
DPORTS="-m multiport --dport"
SPORTS="-m multiport --sport"
ACCEPT="-j ACCEPT"
FROM="-s"
TO="-d"
NEW="-m state --state NEW"
ESTABLISHED="-m state --state ESTABLISHED,RELATED"
MARKED="-m mark --mark"
ANY="0.0.0.0/0.0.0.0"
SETMARK="-j MARK --set-mark"
```

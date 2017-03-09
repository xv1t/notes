# iptables
## Reset all rules
```bash
for table in "nat" "filter" "mangle"; do
  iptables -t $table -F
  iptables -t $table -X
done
```

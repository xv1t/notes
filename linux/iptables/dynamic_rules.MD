# Dynamics rules
For DNS names of hosts only

## Main firewall script
```bash
#!/bin/bash


iptables -F
iptables -X

for table in filter nat mangle; do
	iptables -t $table -F
	iptables -t $table -X
done

iptables -A "INPUT" -i "lo" -j "ACCEPT"
iptables -A "INPUT" -p "icmp" -j "ACCEPT"
iptables -A "INPUT" -m state --state RELATED,ESTABLISHED -j "ACCEPT"

iptables -N "DYNAMIC_ALLOW"

#Run whitescript
source ~/bin/whitelist

iptables -A "DYNAMIC_ALLOW" -j "ACCEPT"

iptables -P INPUT  "DROP"
```

## `whitelist` script

```bash
#!/bin/bash

IPTABLES="/sbin/iptables";

for host in `cat ~/bin/whitelist.txt`; do
        echo -n "add host: [$host] ip: "
        ipaddr=`/usr/bin/host $host | head -n 1 | awk '{print $4}'`
        echo "$ipaddr"

        RULE_COMMENT="D DYNAMIC_ALLOW $host"

        #find exists rule
        RULE_ID=`$IPTABLES -L INPUT -n -v -x --line-numbers | grep "$RULE_COMMENT" | awk '{print $1}'`
        RULE_ADDR=`$IPTABLES -L INPUT -n -v -x --line-numbers | grep "$RULE_COMMENT" | awk '{print $9}'`

        echo RULE_ADDR=$RULE_ADDR;
        #echo "RULE_ID=$RULE_ID, $RULE_COMMENT"

        if [[ "$RULE_ADDR" == $ipaddr ]]; then
                echo "Addres not changed: skipped"
                continue;
        fi

        if [[ $RULE_ID != "" ]]; then
                echo "Remove rule $RULE_ID"
                $IPTABLES -D INPUT $RULE_ID;
        fi
        
        NOW=`date +"%Y-%m-%d %H:%M:%S"`
        
        $IPTABLES -A "INPUT" -s $ipaddr \
                -j "DYNAMIC_ALLOW" \
                -m "comment" \
                --comment "$RULE_COMMENT $NOW"
done
```

## `whitelist.txt`
Text file with your list of DNS names

```
myhst42yvdhvs53g3f4.mydomain.net
f9f6d5eh2negfn.mydomain.net
g4h3j4m1fan2.mydomain.net
```

# crontab

Every 10 min update your dynamic rules

```crontab
MAIL_TO=""
MAILTO=""

#m      h  dom mon dow   command
*/10    *  *   *   *     /root/bin/whitelist
```

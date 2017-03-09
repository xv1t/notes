#squid.conf simple
Default configuration `/etc/squid/squid.conf`
```bash
acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT

http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports
http_access allow localhost manager
http_access deny manager
http_access allow localhost
http_access deny all

http_port 3128

coredump_dir /var/spool/squid

refresh_pattern ^ftp:		1440	20%	10080
refresh_pattern ^gopher:	1440	0%	1440
refresh_pattern -i (/cgi-bin/|\?) 0	0%	0
refresh_pattern (Release|Packages(.gz)*)$      0       20%     2880
refresh_pattern .		0	20%	4320
```

## Auth
```
auth_param basic children 2
auth_param basic program /var/lib/squid/auth
auth_param basic realm Proxy zone
auth_param basic credentialsttl 1 hour

acl auth proxy_auth REQUIRED

#...
http_access deny !auth
```

Auth script `/var/lib/squid/auth`
```bash
#!/bin/bash
unset secret
declare -A secret

load_secret(){
 secret=
 . /var/lib/squid/secret
}

squid_auth(){
 user=$1
 passw=$2

if [[ -f "/dev/shm/update-squid-secrets" ]]; then
 rm "/dev/shm/update-squid-secrets"
 load_secret
fi

if [[  ${secret[$user]} == $passw ]]; then
    echo "OK"
else
    echo "ERR"
fi
}

test1(){
echo "passwords count ${#secret[@]}"
echo ${secret[mag]}
}

start_auth_daemon(){
 load_secret
 while read l; do
     squid_auth $l
 done
}

start_auth_daemon
#EOF
```

File with accounts `/var/lib/squid/secret`
```bash
secret[user1]="PassWoRRd1"
secret[user2]="PassWoRRd2"
secret[user3]="PassWoRRd3"
secret[user4]="PassWoRRd4"
secret[user5]="PassWoRRd55"

```

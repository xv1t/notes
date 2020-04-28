# Knocking technique
Knocking types
- TCP port
- UDP port
- ICMP packet with various size

## TCP
Methods:
1. curl
2. nc (NetCat)
3. HTML page - fake network object with port: image, script, css

### netcat
```bash
# TCP
nc "host.example.com" 56763 -w 1

# UDP
nc -u "host.example.com" 56763 -w 1
```

### Linux device
TCP
```bash
echo 1 > /dev/tcp/host.example.com/56763
```

UDP
```bash
echo 1 > /dev/udp/host.example.com/56763
```

## ICMP
Standard command in all systems - `ping`;

Default `ping` packet size
System   | Size, bytes
---------|-----------:
Windows  | 32
Linux    | 64
macOS    | 64
RouterOS | 50

## Algorythm
Many level address-lists
basic meaning its a check source ip clients and grant access

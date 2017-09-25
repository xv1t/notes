# Hardware information

## List all harddisks
```bash
sudo lshw -class "disk"
```

## Hard disk
```bash
hddparm -I /dev/sda
```

## System: motherboard, buses and other
```bash
dmidecode
```

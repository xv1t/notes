Links
1. http://xgu.ru/wiki/mdadm#.D0.A0.D0.B0.D0.B7.D0.BC.D0.BE.D0.BD.D1.82.D0.B8.D1.80.D0.BE.D0.B2.D0.B0.D0.BD.D0.B8.D0.B5

# mdadm.conf
After the change of the raid array, you need manually update `/etc/mdadm/mdadm.conf`
```bash
mdadm --detail --scan > /etc/mdadm/mdadm.conf
```

#  (auto-read-only) status
```bash
cat /proc/mdstat 
Personalities : [raid1] [linear] [multipath] [raid0] [raid6] [raid5] [raid4] [raid10] 

md126 : active (auto-read-only) raid1 sdd1[1] sdc1[0]
      19514368 blocks super 1.2 [2/2] [UU]
      
md127 : active (auto-read-only) raid1 sdd2[1] sdc2[0]
      3904512 blocks super 1.2 [2/2] [UU]
      
unused devices: <none>
```
For `writing` mode
```bash
mdadm -w /dev/md126
mdadm -w /dev/md127
```
`dmesg`
```
[29037.803924] md: md126 switched to read-write mode.
[29048.204324] md: md127 switched to read-write mode.
```

# metadata

```mdadm /dev/md128 --create --level=1 --raid-devices=2 /dev/sdc3 /dev/sdd3
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device.  If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
Continue creating array?
```

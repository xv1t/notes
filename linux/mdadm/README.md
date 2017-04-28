Links
1. http://xgu.ru/wiki/mdadm#.D0.A0.D0.B0.D0.B7.D0.BC.D0.BE.D0.BD.D1.82.D0.B8.D1.80.D0.BE.D0.B2.D0.B0.D0.BD.D0.B8.D0.B5

# mdadm.conf
After the change of the raid array, you need manually update `/etc/mdadm/mdadm.conf`
```bash
mdadm --detail --scan > /etc/mdadm/mdadm.conf
```

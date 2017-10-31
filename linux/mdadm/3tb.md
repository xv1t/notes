Make root `/dev/md0` partition `/dev/sda1`, `/dev/sdb1` file system NOT `Linux RAID`, BUT **BIOS boot**

After this raid device work is good, but your system was bootable!

fdisk /dev/sda
```
Диск /dev/sda: 2,7 TiB, 3000592982016 байтов, 5860533168 секторов
Единицы измерения: секторов из 1 * 512 = 512 байтов
Размер сектора (логический/физический): 512 байт / 4096 байт
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Тип метки диска: gpt
Идентификатор диска: 4442470C-E8E9-411F-8873-5A6DE9D96FCE

Устр-во         Start      Конец    Секторы  Size Тип
/dev/sda1        2048   29296639   29294592   14G BIOS boot
/dev/sda2    29296640   33202175    3905536  1,9G Linux RAID
/dev/sda3    33202176 3229261823 3196059648  1,5T Linux RAID
/dev/sda4  3229261824 5860533134 2631271311  1,2T Linux RAID
```

fdisk /dev/sdb
```
Диск /dev/sdb: 2,7 TiB, 3000592982016 байтов, 5860533168 секторов
Единицы измерения: секторов из 1 * 512 = 512 байтов
Размер сектора (логический/физический): 512 байт / 4096 байт
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Тип метки диска: gpt
Идентификатор диска: B7E62D5D-02AA-418F-97E2-9CECF1E78D26

Устр-во         Start      Конец    Секторы  Size Тип
/dev/sdb1        2048   29296639   29294592   14G BIOS boot
/dev/sdb2    29296640   33202175    3905536  1,9G Linux RAID
/dev/sdb3    33202176 3229261823 3196059648  1,5T Linux RAID
/dev/sdb4  3229261824 5860533134 2631271311  1,2T Linux RAID
```

`cat /proc/mdstat`
```
md0 : active raid1 sda1[0] sdb1[1]
      14639104 blocks super 1.2 [2/2] [UU]
      
md2 : active raid1 sda3[0] sdb3[2]
      1597898752 blocks super 1.2 [2/2] [UU]
      bitmap: 0/12 pages [0KB], 65536KB chunk

md1 : active raid1 sda2[0] sdb2[1]
      1951744 blocks super 1.2 [2/2] [UU]
      
md3 : active raid1 sda4[0] sdb4[2]
      1315504576 blocks super 1.2 [2/2] [UU]
      bitmap: 0/10 pages [0KB], 65536KB chunk
```

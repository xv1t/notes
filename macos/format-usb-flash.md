# Format USB Flash

```bash
user@macos$ diskutil "list"
```
Output
```
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *121.3 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                 Apple_APFS Container disk1         121.1 GB   disk0s2

/dev/disk1 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +121.1 GB   disk1
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD            81.5 GB    disk1s1
   2:                APFS Volume Preboot                 43.9 MB    disk1s2
   3:                APFS Volume Recovery                510.4 MB   disk1s3
   4:                APFS Volume VM                      3.2 GB     disk1s4

/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *31.0 GB    disk2
   1:             Windows_FAT_32 KINGSTON                31.0 GB    disk2s1

```

USB flash disk is `/dev/disk2`

## Format drive

```bash
sudo diskutil eraseDisk FAT32 "KINGSTON" MBRFormat "/dev/disk2"
```

Complete

```
Started erase on disk2
Unmounting disk
Creating the partition map
Waiting for partitions to activate
Formatting disk2s1 as MS-DOS (FAT32) with name KINGSTON
512 bytes per physical sector
/dev/rdisk2s1: 60523616 sectors in 1891363 FAT32 clusters (16384 bytes/cluster)
bps=512 spc=32 res=32 nft=2 mid=0xf8 spt=32 hds=255 hid=2048 drv=0x80 bsec=60553216 bspf=14777 rdcl=2 infs=1 bkbs=6
Mounting disk
Finished erase on disk2
```

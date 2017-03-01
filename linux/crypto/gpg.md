# Compare gpg/tar/gzip

Test results

tar compress | gpg | gpg compress | compress time | file size | extract time
-------------|-----|--------------|------:|-----------:|------------:
  No         |  No | -            | 4.126 |  363M      | 0.644
  Yes        |  No | -            | 11.399|  214M     | 2.577        
  No         |  Yes| Yes          | 11.612|  219M     |  7.950            
   Yes       |  Yes| Yes          | 19.284|  214M     | 8.540             
  Yes       | Yes | No            | 13.880|  215M     | 7.448              
  No       | Yes | No            | 4.620|  366M     | 8.160             
             
             
#compress
```
Sourcedir `~/.cache`
size: 382M

tar cf data1.tar ~/.cache
real	0m4.126s
user	0m0.140s
sys	0m1.264s
data1.tar   363M 

tar cfz data1.tar.gz ~/.cache
real	0m11.399s
user	0m11.360s
sys  	0m0.596s
data1.tar.gz    214M

tar c $HOME/.cache | gpg  --passphrase-file passphrase -c -o data1.tar.gpg
real	0m11.612s
user	0m11.504s
sys	  0m0.720s
data1.tar.gpg     219M

tar cz $HOME/.cache | gpg  --passphrase-file passphrase -c -o data1.tar.gz.gpg
real	0m11.562s
user	0m19.284s
sys	  0m0.736s
data1.tar.gz.gpg    214M
```
Disable GPG compress
```
tar cz ~/.cache/ | gpg --passphrase-file passphrase -c --compress-level 0 -o data1.tar.gz.gpg
real	0m11.438s
user	0m13.880s
sys	0m0.764s
data1.tar.gz.gp   215M
```
Disable tar and GPG compress
```
tar c ~/.cache/ | gpg --passphrase-file passphrase -c --compress-level 0 -o data1.tar.gpg
real	0m4.620s
user	0m3.912s
sys	  0m0.896s
data1.tar.gpg     366M
```

```bash
$ file *
data1.tar:        POSIX tar archive (GNU)
data1.tar.gpg:    GPG symmetrically encrypted data (AES cipher)
data1.tar.gz:     gzip compressed data, last modified: Thu Nov  3 05:42:33 2016, from Unix
data1.tar.gz.gpg: GPG symmetrically encrypted data (AES cipher)
passphrase:       ASCII text
```
# extract
```

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
gpg --passphrase-file passphrase -d data1.tar.gz.gpg | tar xz
real	0m6.017s
user	0m8.540s
sys	  0m1.032s

gpg --passphrase-file passphrase -d data1.tar.gpg | tar x
real	0m7.950s
user	0m7.924s
sys	  0m0.844s

tar xf data1.tar
real	0m0.644s
user	0m0.056s
sys	  0m0.412s

tar xfz data1.tar.gz
real	0m2.577s
user	0m2.520s
sys	  0m0.552s
```
Without gpg compress
```
gpg --passphrase-file passphrase -d data1.tar.gz.gpg | tar xz
real	0m5.063s
user	0m7.448s
sys	  0m0.980s
```

Without GPG compress and TAR compress
```
gpg --passphrase-file passphrase -d data1.tar.gpg | tar x
real	0m8.160s
user	0m8.160s
sys	  0m0.868s
```
#Splitted parts
50M max for each part
```bash
tar c ~/.wine/                 \
| gpg                           \
    --compress-level 0           \
    -c `#crypt it`                \
    --passphrase-file "passphrase" \
    -o - `#output to stdout`        \ 
| split                       \
    --verbose                  \
    -b 50M `#size per parts`    \
    -d `#marked parts by digits` \
    - `#get data from stdin`      \
    "data.tar.gpg-part"
```
After compress 
```
data.tar.gpg-part00
data.tar.gpg-part01
data.tar.gpg-part02
data.tar.gpg-part03
data.tar.gpg-part04
data.tar.gpg-part05
data.tar.gpg-part06
```
Splitted parts easely upload on the low-speeded channels separately

Decrypt parts and restore
```bash
cat data*                            \ 
| gpg                                 \
    -d `#decrypt`                      \
    --passphrase-file "passphrase_file" \
    -o - `#output to stdout`             \ 
| tar x `#extract tar archive`
```
## Remote pipe
Use options `--no-use-agent`  and `--no-tty`
```bash
tar c . |\ 
  ssh $REMOTE_SSH_HOST "cat | tee /srv/data0/tmp/test.tar |gpg -c -o - --passphrase-file /srv/data0/tmp/passphrase --no-use-agent --no-tty > /srv/data0/tmp/test.tar.gpg"
```
Remote pipe cmd script:
```bash
cat \ 
| tee "/srv/data0/tmp/test.tar" \
| gpg -c -o - \
    --passphrase-file "/srv/data0/tmp/passphrase" \
    --no-use-agent \
    --no-tty \
> "/srv/data0/tmp/test.tar.gpg";
```

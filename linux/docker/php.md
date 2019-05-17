Dockerfile

```Dockerfile
FROM php:fpm

apt-get install -y zlib1g-dev libicu-dev g++ \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl
```


Avialable extensions
```
bcmath      dba           ftp      interbase  mysqlnd  pdo           pdo_sqlite  reflection  sockets   sysvshm    xmlwriter
bz2         dom           gd       intl       oci8     pdo_dblib     pgsql       session     sodium    tidy       xsl
calendar    enchant       gettext  json       odbc     pdo_firebird  phar        shmop       spl       tokenizer  zend_test
com_dotnet  exif          gmp      ldap       opcache  pdo_mysql     posix       simplexml   sqlite3   wddx       zip
ctype       ext_skel.php  hash     libxml     openssl  pdo_oci       pspell      skeleton    standard  xml        zlib
curl        fileinfo      iconv    mbstring   pcntl    pdo_odbc      readline    snmp        sysvmsg   xmlreader
date        filter        imap     mysqli     pcre     pdo_pgsql     recode      soap        sysvsem   xmlrpc

```

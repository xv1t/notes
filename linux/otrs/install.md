# Prepare system
## Package dependence
```bash
sudo apt "upgrade";
sudo apt "install" -y \
      apache2 libapache2-mod-perl2 libdbd-mysql-perl \
      libtimedate-perl libnet-dns-perl libnet-ldap-perl \
      libio-socket-ssl-perl libpdf-api2-perl libsoap-lite-perl \
      libtext-csv-xs-perl libjson-xs-perl libapache-dbi-perl \
      libxml-libxml-perl libxml-libxslt-perl libyaml-perl \
      libarchive-zip-perl libcrypt-eksblowfish-perl libencode-hanextra-perl \
      libmail-imapclient-perl libtemplate-perl libdatetime-perl \
      libdbd-odbc-perl libdbd-pg-perl libauthen-ntlm-perl cron sendmail wget;
```
## Install MySQL server
```bash
sudo apt install mysql-server
```
Add A config to

## Add account
```bash
sudo useradd "otrs" -d "/opt/otrs/" -G "www-data" -c "OTRS User";
```
## Clean package cache for docker
```bash
sudo apt-get -y autoremove && \
sudo apt-get -y clean && \
sudo rm -rf /var/lib/apt/lists/*
```
## Download otrs
Go to https://github.com/OTRS/otrs/releases
For example download a `rel-6_0_18`
```bash
cd "/tmp"
wget "https://github.com/OTRS/otrs/archive/rel-6_0_18.tar.gz"
```



# Config mail
## IMAP

## SMTP
go to utl `/otrs/index.pl?Action=AdminSystemConfiguration`
Set options, for example for yandex.ru

Option                  | Value
------------------------|----------
SendmailModule          | SMTPS
NotificationSenderEmail | otrs-email@yandex.ru
SendmailModule::AuthPassword  | ********
SendmailModule::AuthUser | otrs-email@yandex.ru
SendmailModule::Host | smtp.yandex.ru
SendmailModule::Port | 465
SendmailNotificationEnvelopeFrom | otrs-email@yandex.ru



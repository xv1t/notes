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
Add A config to `/etc/mysql/mysql.conf.d`
create config file `otrs.cfg`
```ini
# otrs.cfg
[mysqld]
skip-host-cache
skip-name-resolve
max_allowed_packet = 64M
query_cache_size = 32M
innodb_log_file_size = 512M
character-set-server = utf8
collation-server = utf8_unicode_ci
```

Restart `mysql`
```bash
service "mysql" restart
```

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
Move app
```bash
mv rel-6_0_18.tar.gz /opt/otrs
```

## Setup
```bash
/opt/otrs/bin/otrs.SetPermissions.pl --web-group=www-data; 
perl /opt/otrs/bin/otrs.CheckModules.pl; 
(cd /opt/otrs/Kernel/; cp Config.pm.dist Config.pm; chmod g+w Config.pm); 
ln -s /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/sites-available/otrs.conf; 
a2ensite otrs.conf; 
a2enmod cgi; 

# create new config files
cp /opt/otrs/var/cron/otrs_daemon.dist /opt/otrs/var/cron/otrs_daemon; 
cp /opt/otrs/var/cron/aaa_base.dist /opt/otrs/var/cron/aaa_base;
```

## Run
```bash
su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash otrs;
su -c "/opt/otrs/bin/Cron.sh start" -s /bin/bash otrs;
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



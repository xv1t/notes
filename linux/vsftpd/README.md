# vsftpd

1. http://jakondo.ru/ustanovka-i-nastrojka-ftp-servera-vsftpd-na-ubuntu-server-14-04-5-lts/
2. https://www.ostechnix.com/install-vsftpd-server-ubuntu-16-04-lts/
3. https://askubuntu.com/questions/413677/vsftpd-530-login-incorrect


# /etc/vsftpd.conf
Quick simple configuration in `Ubuntu Xenial`
```ini
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES

#add this for enable writing in home dir
allow_writeable_chroot=YES

dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
ftpd_banner=Welcome to bu09 FTP service.
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
```

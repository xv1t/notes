#Send email from script

##sendEmail

### requirements
```bash
apt-get install "libio-socket-ssl-perl" "libnet-ssleay-perl"
apt-get install "sendemail"
```

###Example
```bash
sendEmail \
  -f  "from@email.ru" `#From email address`\
  -t  "to@email.ru" `#to email`\
  -u  "test sendEmail" `#Subject text`\
  -s  "smtp.yandex.ru:587" `#smtp server:port`\
  -o  "tls=yes" `#Use TLS: Yes`\
  -xu "account@email.ru" `#Main user account` \
  -xp "PasswordText" `#Password on mail server` \
  -m  "Message body" `#Plain text of body` \
  -a  "/tmp/file1" "/tmp/file2" `#Attach a files to message`
```

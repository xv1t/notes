# Secure MikroTik settings
## 1. ip services

Change ssh port to unstandart, winbox filter access networks

```bash
/ip service
  set telnet disabled=yes
  set ftp disabled=yes
  set www disabled=yes
  set ssh port=18623
  set api disabled=yes
  set winbox address=192.168.88.0/24,127.0.0.0/24
  set api-ssl disabled=yes
```

## 2. SSH

generate on your localhost key with passphrase
```bash
ssh-key-gen
```
Upload id_rsa.pub to mikrotik.

Import public key to user
```bash
/user ssh-keys import public-key-file=id_rsa.pub 
```
Test connect via ssh by key without password
```bash
ssh admin@11.22.33.44 -p 18623
```
Fast connect setup:
```bash
#File: ~/.ssh/config
Host mymikrotik
User admin
Port 18623
```
And run:
```bash
ssh mikrotik
```
Enjoy

WARNING: After import ssh public key - password auth is deny!
## 3. Tools/Mac server
## 4. IP/Neighbor List/Discovery Interfaces


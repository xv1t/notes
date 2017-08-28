# smbclient

links
1. http://smb-conf.ru/smbclient-command-line-smb-client.html

## List shares
```bash
smbclient -L smbserver -U Administrator
Enter Administrator's password: ******
```
Example output
```
Domain=[WORKGROUP] OS=[Windows 6.1] Server=[Samba 4.3.11-Ubuntu]

	Sharename       Type      Comment
	---------       ----      -------
	print$          Disk      Printer Drivers
	doc             Disk      
	public          Disk      
	appl            Disk      
	IPC$            IPC       IPC Service (Samba 4.3.11-Ubuntu)
	admin           Disk      Home Directories
Domain=[WORKGROUP] OS=[Windows 6.1] Server=[Samba 4.3.11-Ubuntu]

	Server               Comment
	---------            -------
	SMBSERVER            Samba 4.3.11-Ubuntu
	PETR-PC              

	Workgroup            Master
	---------            -------
	WORKGROUP            SMBSERVER
```
## Explore smb share
```bash
smbclient `\\smbserver\public` -U Administrator
#or
smbclient //smbserver/public` -U Administrator
```
Example output
```
smb: \> 
```
Abialable commands:
```
?              allinfo        altname        archive        backup         
blocksize      cancel         case_sensitive cd             chmod          
chown          close          del            dir            du             
echo           exit           get            getfacl        geteas         
hardlink       help           history        iosize         lcd            
link           lock           lowercase      ls             l              
mask           md             mget           mkdir          more           
mput           newer          notify         open           posix          
posix_encrypt  posix_open     posix_mkdir    posix_rmdir    posix_unlink   
print          prompt         put            pwd            q              
queue          quit           readlink       rd             recurse        
reget          rename         reput          rm             rmdir          
showacls       setea          setmode        stat           symlink        
tar            tarmode        timeout        translate      unlock         
volume         vuid           wdel           logon          listconnect    
showconnect    tcon           tdis           tid            logoff         
..             !
```

### Put
```
smb: \> help put
HELP put:
	<local name> [remote name] put a file
```
## Upload file to smberver
Copy file `/etc/hosts` to share `public`
```bash
smbclient //smbserver/public -c "put /etc/hosts hosts" -U Administrator
```
## Download file
```
mget remotefile
```

# Windows NT
Add to  `/etc/samba/smb.conf`
```ini
client use spnego = no
```

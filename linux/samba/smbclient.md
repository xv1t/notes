# smbclient
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
?               cancel          dir             hardlink        listconnect     md              open            print           rd              rmdir           tar             unlock
..              case_sensitive  du              help            lock            mget            posix           prompt          readlink        setea           tarmode         volume
allinfo         cd              echo            history         logoff          mkdir           posix_encrypt   put             recurse         setmode         tcon            vuid
altname         chmod           exit            iosize          logon           more            posix_mkdir     pwd             reget           showacls        tdis            wdel
archive         chown           get             l               lowercase       mput            posix_open      q               rename          showconnect     tid             
backup          close           geteas          lcd             ls              newer           posix_rmdir     queue           reput           stat            timeout         
blocksize       del             getfacl         link            mask            notify          posix_unlink    quit            rm              symlink         translate
```
## Copy file to smberver
Copy file `/etc/hosts` to share `public`
```bash
smbclient //smbserver/public -c "put /etc/hosts hosts" -U Administrator
```

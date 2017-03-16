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

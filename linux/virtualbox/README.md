# VirtualBox-tips
VirtualBox tips for quick work

## List of machines
```bash
VBoxManage list vms
```
Output
```bash
"lserver" {48de9f89-3d5a-4eef-ad4c-08dab5e0eed2}
"bysoft-term-01" {55f9a62d-fe54-47b8-a9e5-e2636e4bd201}
"bysoft01" {c7f008f1-2fdb-47a2-95ad-b201c26358d4}
"debian" {244b6b6f-5df9-4814-9b99-4cb3db6c4e70}
```

For more info for virtual machines
```bash
VBoxManage list vms -l
```

Show only running vms
```bash
VBoxManage list runningvms
```

## Show info for one virtual machine
```bash
VBoxManage showvminfo "lserver"
```

## Control VM
Start VM in background
```bash
VBoxManage startvm "lserver" --type headless
```

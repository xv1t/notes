# Ways
VLAN is enabled in two positions:
1. VLAN for `VM Kernel NICs`
2. VLAN for virtual machine access

It is possible. For example VLAN for Host need `111` and VLAN for virtualmachines: `123`, `111`

I have a once physical NIC.

## Create port groups
Port group name | VLAN | Virtual switch
----------------|------|----------------
VLAN 111 - Host | 111  | vSwitch0
VLAN 111 - VM   | 111  | vSwitch0
VLAN 123 - VM   | 123  | vSwitch0

## Create VMKernel NIC
VMKernel NIC name | Port group
------------------|------------
vmk1              | VLAN 111 - Host

Ok, after this your ESXi host be was in the 111 VLAN, and assign DHCP addres from VLAN 111 successfull

## Virtual machine

In the VM set the network is `VLAN 111 - VM` for VLAN 111 or, `VLAN 123 - VM` for VLAN 123

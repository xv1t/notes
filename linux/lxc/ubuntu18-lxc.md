# Migrate lxc containers from 16.04 to 18.04

## LXC Container with ubuntu 12 `precise` release
For example lxc name is `docrender01`

Typical `config`
```ini
lxc.mount = /var/lib/lxc/docrender01/fstab
lxc.mount.entry = proc proc proc nodev,noexec,nosuid 0 0
lxc.mount.entry = sysfs sys sysfs defaults 0 0
lxc.mount.entry = /sys/fs/fuse/connections sys/fs/fuse/connections none bind,optional 0 0
lxc.mount.entry = /sys/kernel/debug sys/kernel/debug none bind,optional 0 0
lxc.mount.entry = /sys/kernel/security sys/kernel/security none bind,optional 0 0
lxc.mount.entry = /sys/fs/pstore sys/fs/pstore none bind,optional 0 0
lxc.tty = 4
lxc.pts = 1024
lxc.devttydir = lxc
lxc.arch = x86_64
lxc.cgroup.devices.deny = a
lxc.cgroup.devices.allow = c *:* m
lxc.cgroup.devices.allow = b *:* m
lxc.cgroup.devices.allow = c 1:3 rwm
lxc.cgroup.devices.allow = c 1:5 rwm
lxc.cgroup.devices.allow = c 5:0 rwm
lxc.cgroup.devices.allow = c 5:1 rwm
lxc.cgroup.devices.allow = c 1:8 rwm
lxc.cgroup.devices.allow = c 1:9 rwm
lxc.cgroup.devices.allow = c 5:2 rwm
lxc.cgroup.devices.allow = c 136:* rwm
lxc.cgroup.devices.allow = c 254:0 rm
lxc.cgroup.devices.allow = c 10:229 rwm
lxc.cgroup.devices.allow = c 10:200 rwm
lxc.cgroup.devices.allow = c 1:7 rwm
lxc.cgroup.devices.allow = c 10:228 rwm
lxc.cgroup.devices.allow = c 10:232 rwm
lxc.utsname = docrender01
lxc.network.type = veth
lxc.network.flags = up
lxc.network.link = lanbr0
lxc.network.hwaddr = 00:16:3e:14:d7:15
lxc.cap.drop = sys_module
lxc.cap.drop = mac_admin
lxc.cap.drop = mac_override
lxc.cap.drop = sys_time
lxc.rootfs = /var/lib/lxc/docrender01/rootfs
lxc.pivotdir = lxc_putold
```
After start container
```
lxc-start: docrender01: confile.c: parse_line: 2262 Unknown configuration key "lxc.mount"
lxc-start: docrender01: parse.c: lxc_file_for_each_line_mmap: 142 Failed to parse config file "/var/lib/lxc/docrender01/config" at line "lxc.mount = /var/lib/lxc/docrender01/fstab"
Failed to load config for docrender01
lxc-start: docrender01: tools/lxc_start.c: main: 264 Failed to create lxc_container
```
Clear `config` after the create new container with trmplate `precise`
```ini
# Template used to create this container: /usr/share/lxc/templates/lxc-ubuntu
# Parameters passed to the template: -r precise
# Template script checksum (SHA-1): 257d846f4a08d6c9a4de6e43d489d6c41603b175
# For additional config options, please look at lxc.container.conf(5)

# Uncomment the following line to support nesting containers:
#lxc.include = /usr/share/lxc/config/nesting.conf
# (Be aware this has security implications)


# Common configuration
lxc.include = /usr/share/lxc/config/ubuntu.common.conf

# Container specific configuration
lxc.rootfs.path = dir:/var/lib/lxc/template1/rootfs
lxc.uts.name = template1
lxc.arch = amd64

# Network configuration
lxc.net.0.type = veth
lxc.net.0.link = lxcbr0
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:6a:c7:53
```
Working config file

Change only variables
 - lxc.rootfs.path
 - lxc.uts.name
 - lxc.net.0.link = lanbr0
 - lxc.net.0.hwaddr = 00:16:3e:14:d7:15

```ini
lxc.include = /usr/share/lxc/config/ubuntu.common.conf

# Container specific configuration
lxc.rootfs.path = dir:/var/lib/lxc/docrender01/rootfs
lxc.uts.name = docrender01
lxc.arch = amd64

# Network configuration
lxc.net.0.type = veth
lxc.net.0.link = lanbr0
lxc.net.0.flags = up
lxc.net.0.hwaddr = 00:16:3e:14:d7:15
```


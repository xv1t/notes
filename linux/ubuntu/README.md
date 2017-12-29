![](http://design.ubuntu.com/wp-content/uploads/ubuntu-logo112.png)

# Remove old kernel packages
My system
```bash
uname -a
Linux rec 4.4.0-101-lowlatency #124-Ubuntu SMP PREEMPT Fri Nov 10 19:25:08 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
```
Linux kernel is a `4.4.0-101-lowlatency`

## First reboot!
Please reboot

## Linux image
```bash
dpkg -l                                \
  | grep "linux-image"                  \
  | awk '{print $2}'                     \
  | grep -v `uname -a | awk '{print $3}'` \
  | grep -v "linux-image-lowlatency"       \
  | grep -v "linux-image-generic"           
  
```
return old image packages
```
linux-image-4.4.0-31-lowlatency
linux-image-4.4.0-38-lowlatency
linux-image-4.4.0-43-lowlatency
linux-image-4.4.0-45-lowlatency
linux-image-4.4.0-47-lowlatency
linux-image-4.4.0-51-lowlatency
linux-image-4.4.0-53-lowlatency
linux-image-4.4.0-57-lowlatency
linux-image-4.4.0-59-lowlatency
linux-image-4.4.0-62-lowlatency
linux-image-4.4.0-64-lowlatency
linux-image-4.4.0-66-lowlatency
linux-image-4.4.0-71-lowlatency
linux-image-4.4.0-72-lowlatency
linux-image-4.4.0-75-lowlatency
linux-image-4.4.0-77-lowlatency
linux-image-4.4.0-78-lowlatency
linux-image-4.4.0-79-lowlatency
linux-image-4.4.0-81-lowlatency
linux-image-4.4.0-83-lowlatency
linux-image-4.4.0-87-lowlatency
linux-image-4.4.0-92-lowlatency
linux-image-4.4.0-93-lowlatency
linux-image-4.4.0-96-lowlatency
linux-image-4.4.0-97-lowlatency
linux-image-4.4.0-98-lowlatency
```
get one line
```bash
dpkg -l                                \
  | grep "linux-image"                  \
  | awk '{print $2}'                     \
  | grep -v `uname -a | awk '{print $3}'` \
  | grep -v "linux-image-lowlatency"       \
  | xargs
```
return

`linux-image-4.4.0-31-lowlatency linux-image-4.4.0-38-lowlatency linux-image-4.4.0-43-lowlatency linux-image-4.4.0-45-lowlatency linux-image-4.4.0-47-lowlatency linux-image-4.4.0-51-lowlatency linux-image-4.4.0-53-lowlatency linux-image-4.4.0-57-lowlatency linux-image-4.4.0-59-lowlatency linux-image-4.4.0-62-lowlatency linux-image-4.4.0-64-lowlatency linux-image-4.4.0-66-lowlatency linux-image-4.4.0-71-lowlatency linux-image-4.4.0-72-lowlatency linux-image-4.4.0-75-lowlatency linux-image-4.4.0-77-lowlatency linux-image-4.4.0-78-lowlatency linux-image-4.4.0-79-lowlatency linux-image-4.4.0-81-lowlatency linux-image-4.4.0-83-lowlatency linux-image-4.4.0-87-lowlatency linux-image-4.4.0-92-lowlatency linux-image-4.4.0-93-lowlatency linux-image-4.4.0-96-lowlatency linux-image-4.4.0-97-lowlatency linux-image-4.4.0-98-lowlatency`

And insert this big line into
```bash
sudo apt remove `#here`
```
And delete about 500MB

## linux-headers
```bash
dpkg -l                               \
  | grep "linux-headers"               \
  | awk '{print $2}'                    \
  | grep -v `uname -a | awk '{print $3}'`\
  | grep -v "linux-headers-lowlatency"    \
  | grep -v "linux-headers-generic"
```
returns old headers packages list
```
linux-headers-4.4.0-101
linux-headers-4.4.0-97
linux-headers-4.4.0-97-lowlatency
linux-headers-4.4.0-98
linux-headers-4.4.0-98-lowlatency
```
And after `xargs`
```bash
dpkg -l                               \
  | grep "linux-headers"               \
  | awk '{print $2}'                    \
  | grep -v `uname -a | awk '{print $3}'`\
  | grep -v "linux-headers-lowlatency"    \
  | grep -v "linux-headers-generic"        \
  | xargs
```
Returns

`linux-headers-4.4.0-101 linux-headers-4.4.0-97 linux-headers-4.4.0-97-lowlatency linux-headers-4.4.0-98 linux-headers-4.4.0-98-lowlatency`

And put this package list into
```bash
sudo apt remove <...>
```
Deleting about 250MB


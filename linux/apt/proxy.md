# Install packages via proxy
## Cliens
Write file `/etc/apt/apt.conf.d/02proxy`
```bash
Acquire { http::Proxy "http://debproxy02:8000/"; }
```
## Server
Where `debproxy02` is a network host with installed package `squid-deb-proxy`
Example of `/etc/squid-deb-proxy/mirror-dstdomain.acl.d/10-default`
```
# /etc/squid-deb-proxy/mirror-dstdomain.acl.d/10-default
# 
# network destinations that are allowed by this cache

# launchpad personal package archives (disabled by default)
#ppa.launchpad.net
#private-ppa.launchpad.net

# add additional mirror domains here (disabled by default)
#linux.dropbox.com
download.virtualbox.org
#archive.getdeb.net
#packages.medibuntu.org
#dl.google.com
#repo.steampowered.com
downloads.sourceforge.net
sourceforge.net
```

# CakePHP 3.0 on NGINX

https://book.cakephp.org/3.0/en/installation.html#nginx

Ubuntu packages
```bash
sudo apt install       \
  "php-cli" "php7.0-fpm" \
  "nginx"
```

# TCP
## PHP-FPM config TCP:9000
`/etc/php/7.0/fpm/pool.d/www.conf`
```ini
; The address on which to accept FastCGI requests.
; Valid syntaxes are:
;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific IPv4 address on
;                            a specific port;
;   '[ip:6:addr:ess]:port' - to listen on a TCP socket to a specific IPv6 address on
;                            a specific port;
;   'port'                 - to listen on a TCP socket to all addresses
;                            (IPv6 and IPv4-mapped) on a specific port;
;   '/path/to/unix/socket' - to listen on a unix socket.
; Note: This value is mandatory.
;listen = /run/php/php7.0-fpm.sock
listen = localhost:9000
```
## NGINX virtual server config
Standalone individual port 8080
```
server {
        listen  8080;
        root    /var/www/cakephp3/apptest/webroot;
        index   index.php;
        location / {
                try_files $uri $uri/ /index.php?$args;
        }
        location ~ \.php$ {
                try_files $uri =404;
                include fastcgi_params;
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                fastcgi_intercept_errors on;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
```
By server name, CakePHP3, `/etc/nginx/sites-enabled/cake3.conf`
```conf
server {
        listen          80;
        server_name     cake3.web05.lxc.net;
        root            /var/www/cakephp3/apptest/webroot;
        index           index.php;
        location / {
                try_files $uri $uri/ /index.php?$args;
        }
        location ~ \.php$ {
                try_files $uri =404;
                include fastcgi_params;
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                fastcgi_intercept_errors on;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
```

CakePHP2, `/etc/nginx/sites-enabled/cake2.conf`
```
server {
        listen          80;
        server_name     cake2.web05.lxc.net;
        root            /var/www/cakephp2/cakephp-2.10.6/app/webroot;
        index           index.php;
        location / {
                try_files $uri $uri/ /index.php?$args;
        }
        location ~ \.php$ {
                try_files $uri =404;
                include fastcgi_params;
                fastcgi_pass 127.0.0.1:9000;
                fastcgi_index index.php;
                fastcgi_intercept_errors on;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
```
# PHP-FPM unix socket
```
; The address on which to accept FastCGI requests.
; Valid syntaxes are:
;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific IPv4 address on
;                            a specific port;
;   '[ip:6:addr:ess]:port' - to listen on a TCP socket to a specific IPv6 address on
;                            a specific port;
;   'port'                 - to listen on a TCP socket to all addresses
;                            (IPv6 and IPv4-mapped) on a specific port;
;   '/path/to/unix/socket' - to listen on a unix socket.
; Note: This value is mandatory.
listen = /run/php/php7.0-fpm.sock
```
## NGINX

For unix sockets use:
```
fastcgi_pass unix:/run/php/php7.0-fpm.sock;
```

Full config fo `CakePHP3`

```
server {
        listen          80;
        server_name     cake3.web05.lxc.net;
        root            /var/www/cakephp3/apptest/webroot;
        index           index.php;
        location / {
                try_files $uri $uri/ /index.php?$args;
        }
        location ~ \.php$ {
                try_files $uri =404;
                include fastcgi_params;
                #fastcgi_pass 127.0.0.1:9000;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                fastcgi_index index.php;
                fastcgi_intercept_errors on;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}
```

Full config for `CakePHP2`
```
server {
        listen          80;
        server_name     cake2.web05.lxc.net;
        root            /var/www/cakephp2/cakephp-2.10.6/app/webroot;
        index           index.php;
        location / {
                try_files $uri $uri/ /index.php?$args;
        }
        location ~ \.php$ {
                try_files $uri =404;
                include fastcgi_params;
                #fastcgi_pass 127.0.0.1:9000;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                fastcgi_index index.php;
                fastcgi_intercept_errors on;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }
}

```



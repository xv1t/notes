# CakePHP 3.0 on NGINX
Ubuntu packages
```bash
sudo apt install       \
  "php-cli" "php7.0-fpm" \
  "nginx"
```

# PHP-FPM config
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
# NGINX virtual server config
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


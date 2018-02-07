```nginx
server {
        listen 20443;

        ssl                     on;
        ssl_certificate         /etc/nginx/ssl/server.crt;
        ssl_certificate_key     /etc/nginx/ssl/server.pem;
        ssl_client_certificate  /etc/nginx/ssl/ca.crt;
        ssl_crl                 /etc/nginx/ssl/crl.pem;
        ssl_verify_client       on;

        keepalive_timeout 70;

    # many subdomains
    server_name         unit*.domain.ru  test*.domain.ru ;
    root                /var/www/apps/cake2/iodoc/app/webroot;
    index               index.php;

    location /libs {
        root /var/www/html;
    }

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ { 
        fastcgi_pass    unix:/run/php/php7.0-fpm.sock;
        include         fastcgi_params;
        
        # CUSTOM VARIABLES
        fastcgi_param   IODOC_MULTI_UNITS 'YES';
        fastcgi_param   IODOC_SERVER_NAME $host;
        
        # SSL VARIABLES
        fastcgi_param   SSL_VERIFIED $ssl_client_verify;
        fastcgi_param   SSL_CLIENT_SERIAL $ssl_client_serial;
        fastcgi_param   SSL_CLIENT_DN   $ssl_client_i_dn;
        fastcgi_param   SSL_DN          $ssl_client_s_dn;

        fastcgi_index index.php; 
        fastcgi_intercept_errors on;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }
}
```

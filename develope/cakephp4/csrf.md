# Disable CSRF
## Edit file `config/routes.php`
Comment lines this
```php
/* $builder->registerMiddleware('csrf', new CsrfProtectionMiddleware([
        'httpOnly' => true,
    ])); */
```
... and this

```php
 //$builder->applyMiddleware('csrf');
```

# CakePHP3


Add to `config/bootstrap.php`
```php
//For normal format
Cake\I18n\Date::setToStringFormat('YYYY-MM-dd');
Cake\I18n\FrozenDate::setToStringFormat('YYYY-MM-dd');
```

before
```php
/*
 * Enable immutable time objects in the ORM.
 *
 * You can enable default locale format parsing by adding calls
 * to `useLocaleParser()`. This enables the automatic conversion of
 * locale specific date formats. For details see
 * @link https://book.cakephp.org/3.0/en/core-libraries/internationalization-and-localization.html#parsing-localized-datetime-data
 */
Type::build('time')
    ->useImmutable();
Type::build('date')
    ->useImmutable();
Type::build('datetime')
    ->useImmutable();
Type::build('timestamp')
    ->useImmutable();
```

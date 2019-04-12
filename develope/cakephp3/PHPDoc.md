# CakePHP2
## Object property links

```php
<?php
/**
 * @property AppModel $Post
 * @property AppModel $UserRole
 */
class UsersController extends AppController{
  
}
```

## $this in the ctp file
```php
/* @var $this View */
```

## $this with autocomplete Helpers for ctp files
```php
/**
 *
 * @property MyHelper $MyHelper
 */
class myView extends View(){
  /**
   * @var MyHelper
   */
   var $MyHelper = null;
    public function __construct(\Controller $controller = null) {
        unset($this->MyHelper);
        parent::__construct($controller);
    }   
}
```

in the ctp file
```php
/* @var $this myView */

$this->MyHelper->
```

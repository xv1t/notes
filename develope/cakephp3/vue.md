# Elegant method for inserting Vue JS coding

For example add JavaScript logic for `index.ctp` without tag `<script>` int ctp templates 

```
Template/Users/
  ./index.ctp
  ./index.ctp.js
```

Add to `AppView.php` method
```php
    public function js($file = null)
    {

        if (!$file) {
            $file = $this->_current;
        }

        $js_file = $file . '.js';
        if (file_exists($js_file)) {
            return join([
                '<script>',
                file_get_contents($js_file),
                '</script>'
            ]);
        }
    }

```

In the `Template/Users/index.ctp` add line in the last line `<?=$this->js()?>`

`index.ctp`

```php
<?php
/* @var $this App\View\AppView */

?>

<div id="app">
    <h1>Header {{ message }}</h1>
    <input id="input01" v-model="message">
    <button @click="btnClick"  name="Twooo">
        click {{ message }}
    </button>
    <button @click="btnClick" name="One">
        click2 {{ message }}
    </button>

    <button @click="btnClick"  name="Threeeeokjjh">
        click3 {{ message }}
    </button>
</div>

<!-- Add last line! -->
<?=$this->js()?>
```

`index.ctp.js`
```js
new Vue({
    el: "#app",
    data: {
        message: "New message"
    },
    methods: {
        btnClick( e ) {
            var btn = e.target;
            console.log( btn.getAttribute('name') );
        }
    }
})
```

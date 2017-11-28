# Send a big object/array via ajax
```javascript
items = [];
for (let i = 0; i<2000; i++){
  item.id = i;
  items.push(i);
}
```

And post it
```javascript
$.ajax({
  url,
  data: {items},
  type: 'POST',
  success(res){
    console.log(res)
  }
})
```

Ok. POST response in the browser:
```
items[]:0
items[]:1
items[]:2
items[]:3
items[]:4
items[]:5
items[]:6
items[]:7
....
....
items[]:1995
items[]:1996
items[]:1997
items[]:1998
items[]:1999
items[]:2000
```
BUT, to server send MAX 1001 Form data line!!!!!!!

For this sad, make through JSON
```javascript
$.ajax({
  url,
  data: {
    items: JSON.stringify(items)
    },
  type: 'POST',
  success(res){
    console.log(res)
  }
})
```

In this time Form Data line is (1)

And size of JSON array, max 8MB (its crazy array size!)

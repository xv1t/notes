# Mail queue
```
mailq | less
```

```
postqueue | less
```

## Force post all mail in queue
```
postqueue -f
```

```
mailq -q
```

```
postsuper -r ALL
```

## Empty queue
```
postsuper -d ALL
```

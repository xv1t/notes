## Show remote branches
```bash
git remote show "origin"
```

## Show avialable branches
```bash
git branch
```
Example
```
* dev
  master
```

## Current branch
```
cat .git/HEAD
```

## Create new branch
```bash
git branch "dev"

#and set as current
git checkout "dev"
```
or
```bash
#create and automatically switch
git checkout -b "dev"
```

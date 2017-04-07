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

```bash
git branch -r
origin/dev
origin/master
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

## Connect to new remote branch
```bash

git branch
* master

git pull
git checkout dev2
git branch
* dev2
  master
```

# CakePHP3 install
## Prepare packages

Install php
```bash
sudo apt install php php-intl php-simplexml php-mbstring php-mysql
```

Install composer
```bash
sudo apt install composer
```

## Create project
Project name example: `project1`
Create dir
```bash
sudo mkdir -p /var/www/apps/

# Change own folder for current user
sudo chown $USER "/var/www/apps/"

# go to folder
cd "/var/www/apps/project1"

# Create project home folder
composer create-project --prefer-dist cakephp/app "project1"
```

## Update all
```bash
cd  "/var/www/apps/project1"
composer update
```



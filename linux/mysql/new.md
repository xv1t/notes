# Create database with UTF-8
```sql
CREATE DATABASE `iodoc` /*!40100 DEFAULT CHARACTER SET utf8 */;
```

Example 2
```sql
CREATE DATABASE `mydb` CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON `mydb`.* TO `username`@localhost IDENTIFIED BY 'password';
```

# Create account for database
```sql
GRANT ALL ON `mydb`.* TO `username`@localhost IDENTIFIED BY 'password';
```

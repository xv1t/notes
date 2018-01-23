Example error for `group`

**Database Error**

Error: SQLSTATE[42000]: Syntax error or access violation: 1055 Expression #93 of

`SELECT` list is not in GROUP BY clause and contains nonaggregated column `*******.id`
which is not functionally dependent on columns in `GROUP BY` clause; this is incompatible with **sql_mode=only_full_group_by**

В файле `/etc/mysql/mysql.conf.d/mysqld.cnf` добавлена опция `sql_mode`

```ini
[mysqld]
sql_mode	= "STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
```

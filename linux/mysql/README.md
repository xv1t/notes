# Get tables/views from database
## Tables
```sql
select
	*
from information_schema.tables
where 
	table_schema LIKE 'iodoc' AND
	TABLE_TYPE LIKE 'BASE TABLE';
```

## Views
```sql
select
	*
from information_schema.tables
where 
	table_schema LIKE 'iodoc' AND
	TABLE_TYPE LIKE 'VIEW';
```

## Stored procedures
```sql
SHOW PROCEDURE STATUS;
SHOW FUNCTION STATUS;
```

## Show grouping statistic for all object
```sql
select
	table_type,
    count(*) `count`
from information_schema.tables
where 
	table_schema LIKE 'iodoc'
group by 
	table_type;
```
out example

table_type | count
-----------|------
BASE TABLE | 90
VIEW       | 43

# Create database with UTF-8
```sql
CREATE DATABASE `iodoc` /*!40100 DEFAULT CHARACTER SET utf8 */;
```

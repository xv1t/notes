# Get object from database
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

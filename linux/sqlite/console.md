# Show bordered table in query
```sql
sqlite> .mode colimn
sqlite> .header
sqlite> select * from comments;
```
```sql
id          commenter   body        article_id  created_at                  updated_at                  disabled  
----------  ----------  ----------  ----------  --------------------------  --------------------------  ----------
9           test        kjhkjh      11          2020-09-23 17:07:01.979896  2020-09-23 17:10:15.997395  1         
```

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
# Show schema
```sql
.schema
```
output
```sql
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "articles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "text" text, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "commenter" varchar, "body" text, "article_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "disabled" boolean, CONSTRAINT "fk_rails_3bf61a60d3"
FOREIGN KEY ("article_id")
  REFERENCES "articles" ("id")
);
CREATE INDEX "index_comments_on_article_id" ON "comments" ("article_id");
```

# Get all process
```
mysql> show processlist;
+--------+------------+-------------------------------+---------+---------+------+------------------------------+------------------------------------------------------------------------------------------------------+
| Id     | User       | Host                          | db      | Command | Time | State                        | Info                                                                                                 |
+--------+------------+-------------------------------+---------+---------+------+------------------------------+------------------------------------------------------------------------------------------------------+
| 144342 | ltx_access | optica01.lservice.local:49853 | jobshop | Sleep   |  158 |                              | NULL                                                                                                 |
| 144651 | ltx_access | optica01.lservice.local:50355 | jobshop | Sleep   |   37 |                              | NULL                                                                                                 |
| 144657 | ltx_access | optica01.lservice.local:50388 | jobshop | Sleep   |    3 |                              | NULL                                                                                                 |
| 144925 | jobshop    | web01.lservice.local:37930    | jobshop | Query   | 3779 | Copying to tmp table         | SELECT `Document`.`id`, sum(`DocumentDatum`.`money_with_nds`) as money_with_nds, sum(`DocumentDatum` |
| 145499 | jobshop    | web01.lservice.local:39214    | jobshop | Query   | 1282 | Waiting for table level lock | DELETE `DocumentDatum` FROM `jobshop`.`document_data` AS `DocumentDatum`   WHERE `DocumentDatum`.`id |
| 145924 | ltx_access | optica01.lservice.local:51799 | jobshop | Sleep   |   37 |                              | NULL                                                                                                 |
| 145929 | ltx_access | optica01.lservice.local:51803 | jobshop | Sleep   |   21 |                              | NULL                                                                                                 |
| 145933 | root       | localhost                     | jobshop | Query   |    0 | NULL                         | show processlist                                                                                     |
+--------+------------+-------------------------------+---------+---------+------+------------------------------+------------------------------------------------------------------------------------------------------+

```

Processes `144925` and `145499` is  many time id 
## Kill em all
```
mysql> kill 144925;
mysql> kill 145499;
```

And show process list
```
mysql> show processlist;
+--------+------------+-------------------------------+---------+---------+------+-------+------------------+
| Id     | User       | Host                          | db      | Command | Time | State | Info             |
+--------+------------+-------------------------------+---------+---------+------+-------+------------------+
| 144342 | ltx_access | optica01.lservice.local:49853 | jobshop | Sleep   |  174 |       | NULL             |
| 144651 | ltx_access | optica01.lservice.local:50355 | jobshop | Sleep   |   53 |       | NULL             |
| 144657 | ltx_access | optica01.lservice.local:50388 | jobshop | Sleep   |   19 |       | NULL             |
| 145924 | ltx_access | optica01.lservice.local:51799 | jobshop | Sleep   |   53 |       | NULL             |
| 145929 | ltx_access | optica01.lservice.local:51803 | jobshop | Sleep   |   37 |       | NULL             |
| 145933 | root       | localhost                     | jobshop | Query   |    0 | NULL  | show processlist |
+--------+------------+-------------------------------+---------+---------+------+-------+------------------+
6 rows in set (0.00 sec)

```

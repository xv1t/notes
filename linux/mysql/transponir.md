# Show fields as lines

Add `\G` in place in `;`

```sql
select * from docouments\G
```

Output sample as
```
*************************** 1. row ***************************
                         id: 64883
                       name: 3/0188
                       date: 2020-05-20
           document_type_id: 21
                  parent_id: NULL
                        lft: 126965
                       rght: 126966
                    created: 2020-05-21 17:12:10
                    updated: 2020-05-28 10:27:56
             create_user_id: 25
             update_user_id: 22
                       test: 0
         waiting_resolution: 1
from_document_resolution_id: NULL
                 visa_count: NULL
               waiting_visa: 0
                 collective: 0
               control_date: NULL
   document_content_type_id: NULL
             addressat_name: NULL
             addressat_date: NULL
                    content: NULL
               with_content: 0
    personal_result_type_id: NULL
                people_list: NULL
            organization_id: 1
      appeal_action_type_id: NULL
                 on_control: 0
     rf_subject_district_id: NULL
           prepared_user_id: 22
1 row in set (0.00 sec)

```

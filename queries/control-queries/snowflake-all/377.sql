select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,warehouse w,customer_demographics cd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 89 and cs.cs_hash <= 422 and d.d_hash >= 485 and d.d_hash <= 885 and c.c_hash >= 127 and c.c_hash <= 877
;

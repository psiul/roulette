select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,customer_demographics cd,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 595 and cs.cs_hash <= 928 and c.c_hash >= 122 and c.c_hash <= 872 and cd.cd_hash >= 93 and cd.cd_hash <= 493
;

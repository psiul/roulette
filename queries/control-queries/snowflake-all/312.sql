select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer c,date_dim d,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 363 and cs.cs_hash <= 696 and d.d_hash >= 94 and d.d_hash <= 494 and cd.cd_hash >= 204 and cd.cd_hash <= 954
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,warehouse w,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 15 and cs.cs_hash <= 765 and d.d_hash >= 85 and d.d_hash <= 418 and c.c_hash >= 441 and c.c_hash <= 841
;

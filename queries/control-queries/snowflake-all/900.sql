select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,warehouse w,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 422 and cs.cs_hash <= 822 and d.d_hash >= 86 and d.d_hash <= 836 and c.c_hash >= 407 and c.c_hash <= 740
;

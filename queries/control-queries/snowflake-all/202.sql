select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,customer c,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cd.cd_hash >= 623 and cd.cd_hash <= 956 and c.c_hash >= 58 and c.c_hash <= 808 and d.d_hash >= 189 and d.d_hash <= 589
;

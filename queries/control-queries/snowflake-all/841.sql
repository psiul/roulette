select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 240 and cs.cs_hash <= 990 and cd.cd_hash >= 476 and cd.cd_hash <= 809 and c.c_hash >= 141 and c.c_hash <= 541
;

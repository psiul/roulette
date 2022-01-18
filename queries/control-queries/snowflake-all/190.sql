select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 72 and cs.cs_hash <= 822 and d.d_hash >= 517 and d.d_hash <= 850 and cd.cd_hash >= 151 and cd.cd_hash <= 551
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 540 and cs.cs_hash <= 873 and d.d_hash >= 502 and d.d_hash <= 902 and cd.cd_hash >= 202 and cd.cd_hash <= 952
;

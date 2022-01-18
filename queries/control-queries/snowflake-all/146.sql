select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 53 and d.d_hash <= 453 and c.c_hash >= 613 and c.c_hash <= 946 and cd.cd_hash >= 33 and cd.cd_hash <= 783
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 235 and cs.cs_hash <= 985 and d.d_hash >= 533 and d.d_hash <= 933 and cd.cd_hash >= 152 and cd.cd_hash <= 485
;

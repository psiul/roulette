select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 172 and d.d_hash <= 505 and c.c_hash >= 223 and c.c_hash <= 623 and cd.cd_hash >= 104 and cd.cd_hash <= 854
;

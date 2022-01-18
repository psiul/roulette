select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 152 and cs.cs_hash <= 552 and d.d_hash >= 176 and d.d_hash <= 926 and cd.cd_hash >= 239 and cd.cd_hash <= 572
;

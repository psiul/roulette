select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,warehouse w,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 142 and cs.cs_hash <= 892 and d.d_hash >= 434 and d.d_hash <= 834 and c.c_hash >= 389 and c.c_hash <= 722
;

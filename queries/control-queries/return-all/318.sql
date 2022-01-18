select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 159 and cs.cs_hash <= 909 and d.d_hash >= 662 and d.d_hash <= 995 and c.c_hash >= 198 and c.c_hash <= 598
;

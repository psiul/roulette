select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,item i,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 70 and cs.cs_hash <= 820 and d.d_hash >= 140 and d.d_hash <= 540 and c.c_hash >= 140 and c.c_hash <= 473
;

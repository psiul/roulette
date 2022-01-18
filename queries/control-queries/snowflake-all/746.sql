select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 82 and cd.cd_hash <= 832 and i.i_hash >= 590 and i.i_hash <= 923 and c.c_hash >= 433 and c.c_hash <= 833
;

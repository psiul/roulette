select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer_demographics cd,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 86 and cs.cs_hash <= 836 and cd.cd_hash >= 60 and cd.cd_hash <= 393 and c.c_hash >= 437 and c.c_hash <= 837
;

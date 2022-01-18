select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer c,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 98 and cs.cs_hash <= 498 and d.d_hash >= 343 and d.d_hash <= 676 and cd.cd_hash >= 218 and cd.cd_hash <= 968
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 236 and cs.cs_hash <= 986 and i.i_hash >= 27 and i.i_hash <= 427 and cd.cd_hash >= 518 and cd.cd_hash <= 851
;

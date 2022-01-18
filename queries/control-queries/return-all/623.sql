select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,customer c,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cd.cd_hash >= 177 and cd.cd_hash <= 927 and i.i_hash >= 39 and i.i_hash <= 439 and d.d_hash >= 308 and d.d_hash <= 641
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and i.i_hash >= 618 and i.i_hash <= 951 and cd.cd_hash >= 206 and cd.cd_hash <= 956 and d.d_hash >= 183 and d.d_hash <= 583
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 263 and cs.cs_hash <= 596 and i.i_hash >= 87 and i.i_hash <= 487 and c.c_hash >= 49 and c.c_hash <= 799
;

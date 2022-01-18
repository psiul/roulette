select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,customer_demographics cd,item i
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 603 and cs.cs_hash <= 936 and c.c_hash >= 213 and c.c_hash <= 963 and i.i_hash >= 430 and i.i_hash <= 830
;

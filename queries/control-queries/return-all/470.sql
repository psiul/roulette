select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,customer_demographics cd,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 62 and cs.cs_hash <= 395 and cd.cd_hash >= 274 and cd.cd_hash <= 674 and c.c_hash >= 150 and c.c_hash <= 900
;

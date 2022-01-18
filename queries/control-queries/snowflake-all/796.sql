select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,customer c,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 11 and cs.cs_hash <= 761 and d.d_hash >= 6 and d.d_hash <= 339 and cd.cd_hash >= 161 and cd.cd_hash <= 561
;

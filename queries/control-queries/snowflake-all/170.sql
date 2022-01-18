select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,household_demographics hd,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 228 and cs.cs_hash <= 561 and d.d_hash >= 216 and d.d_hash <= 966 and hd.hd_hash >= 419 and hd.hd_hash <= 819
;

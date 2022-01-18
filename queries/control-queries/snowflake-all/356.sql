select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 314 and cs.cs_hash <= 714 and c.c_hash >= 217 and c.c_hash <= 967 and hd.hd_hash >= 205 and hd.hd_hash <= 538
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,customer c,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 582 and cs.cs_hash <= 915 and hd.hd_hash >= 241 and hd.hd_hash <= 991 and c.c_hash >= 393 and c.c_hash <= 793
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_demographics cd,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 336 and cs.cs_hash <= 669 and d.d_hash >= 1 and d.d_hash <= 751 and hd.hd_hash >= 301 and hd.hd_hash <= 701
;

select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,household_demographics hd,catalog_returns cr
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 19 and cs.cs_hash <= 352 and c.c_hash >= 471 and c.c_hash <= 871 and hd.hd_hash >= 50 and hd.hd_hash <= 800
;

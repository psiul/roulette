select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,household_demographics hd,catalog_returns cr
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cd.cd_hash >= 108 and cd.cd_hash <= 508 and c.c_hash >= 363 and c.c_hash <= 696 and hd.hd_hash >= 246 and hd.hd_hash <= 996
;

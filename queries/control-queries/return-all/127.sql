select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,household_demographics hd,catalog_returns cr
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and c.c_hash >= 472 and c.c_hash <= 805 and cd.cd_hash >= 108 and cd.cd_hash <= 858 and hd.hd_hash >= 360 and hd.hd_hash <= 760
;

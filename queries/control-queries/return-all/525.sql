select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,customer c,household_demographics hd
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 167 and cd.cd_hash <= 567 and c.c_hash >= 31 and c.c_hash <= 364 and hd.hd_hash >= 25 and hd.hd_hash <= 775
;

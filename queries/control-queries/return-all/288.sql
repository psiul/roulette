select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,catalog_returns cr,household_demographics hd
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 221 and cd.cd_hash <= 554 and c.c_hash >= 144 and c.c_hash <= 544 and hd.hd_hash >= 67 and hd.hd_hash <= 817
;

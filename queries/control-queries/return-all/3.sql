select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 428 and hd.hd_hash <= 761 and c.c_hash >= 377 and c.c_hash <= 777 and cd.cd_hash >= 121 and cd.cd_hash <= 871
;

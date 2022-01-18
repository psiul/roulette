select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,catalog_returns cr,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 229 and cs.cs_hash <= 979 and cd.cd_hash >= 381 and cd.cd_hash <= 781 and c.c_hash >= 210 and c.c_hash <= 543
;

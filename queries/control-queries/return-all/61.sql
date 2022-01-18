select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,catalog_returns cr,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 74 and cs.cs_hash <= 824 and sm.sm_hash >= 71 and sm.sm_hash <= 471 and cd.cd_hash >= 528 and cd.cd_hash <= 861
;

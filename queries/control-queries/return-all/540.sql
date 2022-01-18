select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,catalog_returns cr,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 295 and cs.cs_hash <= 628 and cd.cd_hash >= 45 and cd.cd_hash <= 795 and sm.sm_hash >= 24 and sm.sm_hash <= 424
;

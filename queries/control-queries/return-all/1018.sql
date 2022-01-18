select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,catalog_returns cr,customer_demographics cd,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 220 and cs.cs_hash <= 620 and sm.sm_hash >= 29 and sm.sm_hash <= 779 and c.c_hash >= 39 and c.c_hash <= 372
;

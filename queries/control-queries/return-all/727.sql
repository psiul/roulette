select count(cs.cs_item_sk)
from catalog_sales cs,customer c,catalog_returns cr,customer_demographics cd,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 12 and c.c_hash <= 345 and cd.cd_hash >= 448 and cd.cd_hash <= 848 and sm.sm_hash >= 196 and sm.sm_hash <= 946
;

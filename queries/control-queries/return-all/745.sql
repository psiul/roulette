select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,catalog_returns cr,household_demographics hd,customer c
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 20 and cs.cs_hash <= 420 and sm.sm_hash >= 150 and sm.sm_hash <= 900 and c.c_hash >= 203 and c.c_hash <= 536
;

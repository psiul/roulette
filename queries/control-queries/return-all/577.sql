select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,catalog_returns cr,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 398 and cs.cs_hash <= 798 and sm.sm_hash >= 65 and sm.sm_hash <= 815 and c.c_hash >= 603 and c.c_hash <= 936
;

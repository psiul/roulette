select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,catalog_returns cr,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 97 and cs.cs_hash <= 847 and sm.sm_hash >= 44 and sm.sm_hash <= 377 and hd.hd_hash >= 491 and hd.hd_hash <= 891
;

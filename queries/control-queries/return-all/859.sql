select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,ship_mode sm,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 535 and cs.cs_hash <= 935 and hd.hd_hash >= 94 and hd.hd_hash <= 427 and sm.sm_hash >= 180 and sm.sm_hash <= 930
;

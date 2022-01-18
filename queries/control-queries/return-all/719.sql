select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,warehouse w,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 148 and cs.cs_hash <= 548 and sm.sm_hash >= 354 and sm.sm_hash <= 687 and hd.hd_hash >= 110 and hd.hd_hash <= 860
;

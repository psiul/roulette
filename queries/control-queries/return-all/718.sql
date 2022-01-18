select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,household_demographics hd,warehouse w,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 34 and cs.cs_hash <= 784 and sm.sm_hash >= 453 and sm.sm_hash <= 853 and hd.hd_hash >= 321 and hd.hd_hash <= 654
;

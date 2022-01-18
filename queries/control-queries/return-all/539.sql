select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,ship_mode sm,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 248 and cs.cs_hash <= 648 and hd.hd_hash >= 322 and hd.hd_hash <= 655 and sm.sm_hash >= 14 and sm.sm_hash <= 764
;

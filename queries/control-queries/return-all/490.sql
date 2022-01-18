select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,ship_mode sm,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 85 and cs.cs_hash <= 485 and hd.hd_hash >= 120 and hd.hd_hash <= 870 and i.i_hash >= 452 and i.i_hash <= 785
;

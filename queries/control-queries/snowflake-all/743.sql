select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,warehouse w,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 221 and cs.cs_hash <= 621 and sm.sm_hash >= 181 and sm.sm_hash <= 514 and hd.hd_hash >= 1 and hd.hd_hash <= 751
;

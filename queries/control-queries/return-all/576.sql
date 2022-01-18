select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,item i,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 631 and cs.cs_hash <= 964 and i.i_hash >= 442 and i.i_hash <= 842 and hd.hd_hash >= 203 and hd.hd_hash <= 953
;

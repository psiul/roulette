select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,warehouse w,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 14 and cs.cs_hash <= 764 and i.i_hash >= 254 and i.i_hash <= 587 and sm.sm_hash >= 458 and sm.sm_hash <= 858
;

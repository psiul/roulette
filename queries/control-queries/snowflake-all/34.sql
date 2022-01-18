select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,household_demographics hd,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 411 and cs.cs_hash <= 744 and hd.hd_hash >= 68 and hd.hd_hash <= 818 and sm.sm_hash >= 599 and sm.sm_hash <= 999
;

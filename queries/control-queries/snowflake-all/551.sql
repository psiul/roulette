select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,ship_mode sm,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 197 and d.d_hash <= 597 and sm.sm_hash >= 665 and sm.sm_hash <= 998 and hd.hd_hash >= 130 and hd.hd_hash <= 880
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,warehouse w,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 150 and cs.cs_hash <= 900 and sm.sm_hash >= 413 and sm.sm_hash <= 746 and d.d_hash >= 419 and d.d_hash <= 819
;

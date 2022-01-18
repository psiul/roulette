select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,warehouse w,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 419 and cs.cs_hash <= 819 and d.d_hash >= 7 and d.d_hash <= 757 and hd.hd_hash >= 500 and hd.hd_hash <= 833
;

select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,date_dim d,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 148 and hd.hd_hash <= 898 and d.d_hash >= 124 and d.d_hash <= 457 and sm.sm_hash >= 89 and sm.sm_hash <= 489
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,household_demographics hd,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and sm.sm_hash >= 629 and sm.sm_hash <= 962 and d.d_hash >= 3 and d.d_hash <= 403 and hd.hd_hash >= 47 and hd.hd_hash <= 797
;

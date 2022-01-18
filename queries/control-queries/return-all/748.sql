select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,ship_mode sm,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 377 and cs.cs_hash <= 710 and d.d_hash >= 164 and d.d_hash <= 564 and sm.sm_hash >= 214 and sm.sm_hash <= 964
;

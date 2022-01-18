select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,warehouse w,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and hd.hd_hash >= 210 and hd.hd_hash <= 960 and sm.sm_hash >= 502 and sm.sm_hash <= 902 and d.d_hash >= 608 and d.d_hash <= 941
;

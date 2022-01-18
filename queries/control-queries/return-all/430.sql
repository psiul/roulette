select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,date_dim d,ship_mode sm
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 92 and cs.cs_hash <= 425 and hd.hd_hash >= 66 and hd.hd_hash <= 466 and sm.sm_hash >= 72 and sm.sm_hash <= 822
;

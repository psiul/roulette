select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,warehouse w,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and hd.hd_hash >= 265 and hd.hd_hash <= 598 and d.d_hash >= 185 and d.d_hash <= 585 and sm.sm_hash >= 76 and sm.sm_hash <= 826
;

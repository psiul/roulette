select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,date_dim d,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and hd.hd_hash >= 249 and hd.hd_hash <= 999 and sm.sm_hash >= 330 and sm.sm_hash <= 730 and d.d_hash >= 592 and d.d_hash <= 925
;

select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,ship_mode sm,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 56 and cs.cs_hash <= 806 and d.d_hash >= 581 and d.d_hash <= 981 and sm.sm_hash >= 164 and sm.sm_hash <= 497
;

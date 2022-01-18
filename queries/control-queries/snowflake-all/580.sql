select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,warehouse w,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 132 and cs.cs_hash <= 882 and d.d_hash >= 53 and d.d_hash <= 453 and sm.sm_hash >= 191 and sm.sm_hash <= 524
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,household_demographics hd,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 167 and cs.cs_hash <= 917 and hd.hd_hash >= 229 and hd.hd_hash <= 629 and sm.sm_hash >= 81 and sm.sm_hash <= 414
;

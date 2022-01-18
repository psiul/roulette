select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,ship_mode sm,date_dim d,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 580 and cs.cs_hash <= 913 and sm.sm_hash >= 37 and sm.sm_hash <= 437 and d.d_hash >= 49 and d.d_hash <= 799
;

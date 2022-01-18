select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,ship_mode sm,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 66 and d.d_hash <= 399 and sm.sm_hash >= 233 and sm.sm_hash <= 983 and i.i_hash >= 72 and i.i_hash <= 472
;

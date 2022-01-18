select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,ship_mode sm,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 135 and cs.cs_hash <= 468 and sm.sm_hash >= 0 and sm.sm_hash <= 400 and d.d_hash >= 179 and d.d_hash <= 929
;

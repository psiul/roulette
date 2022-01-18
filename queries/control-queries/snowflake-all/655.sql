select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,item i,ship_mode sm
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 197 and cs.cs_hash <= 597 and i.i_hash >= 625 and i.i_hash <= 958 and sm.sm_hash >= 85 and sm.sm_hash <= 835
;

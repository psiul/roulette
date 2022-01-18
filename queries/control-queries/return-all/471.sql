select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,item i,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 23 and cs.cs_hash <= 356 and sm.sm_hash >= 502 and sm.sm_hash <= 902 and i.i_hash >= 231 and i.i_hash <= 981
;

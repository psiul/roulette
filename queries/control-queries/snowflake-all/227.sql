select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 169 and cs.cs_hash <= 919 and d.d_hash >= 336 and d.d_hash <= 736 and sm.sm_hash >= 369 and sm.sm_hash <= 702
;

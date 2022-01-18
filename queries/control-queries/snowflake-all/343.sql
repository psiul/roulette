select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,warehouse w,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and i.i_hash >= 169 and i.i_hash <= 919 and d.d_hash >= 572 and d.d_hash <= 972 and sm.sm_hash >= 545 and sm.sm_hash <= 878
;

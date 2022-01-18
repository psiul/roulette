select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,date_dim d,item i
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and sm.sm_hash >= 166 and sm.sm_hash <= 916 and d.d_hash >= 353 and d.d_hash <= 686 and i.i_hash >= 533 and i.i_hash <= 933
;

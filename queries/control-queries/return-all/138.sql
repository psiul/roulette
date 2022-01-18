select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,ship_mode sm
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 79 and cs.cs_hash <= 829 and d.d_hash >= 409 and d.d_hash <= 742 and i.i_hash >= 226 and i.i_hash <= 626
;

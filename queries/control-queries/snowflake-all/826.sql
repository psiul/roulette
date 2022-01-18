select count(cs.cs_item_sk)
from catalog_sales cs,item i,ship_mode sm,date_dim d,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 132 and cs.cs_hash <= 882 and i.i_hash >= 155 and i.i_hash <= 488 and d.d_hash >= 248 and d.d_hash <= 648
;

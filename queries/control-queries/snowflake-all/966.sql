select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,ship_mode sm
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 347 and cs.cs_hash <= 747 and i.i_hash >= 223 and i.i_hash <= 973 and d.d_hash >= 109 and d.d_hash <= 442
;

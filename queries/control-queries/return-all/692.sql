select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,warehouse w,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 42 and cs.cs_hash <= 792 and d.d_hash >= 376 and d.d_hash <= 709 and i.i_hash >= 536 and i.i_hash <= 936
;

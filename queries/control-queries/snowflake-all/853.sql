select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 489 and cs.cs_hash <= 889 and sm.sm_hash >= 608 and sm.sm_hash <= 941 and d.d_hash >= 217 and d.d_hash <= 967
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,warehouse w,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 391 and d.d_hash <= 724 and sm.sm_hash >= 63 and sm.sm_hash <= 463 and i.i_hash >= 127 and i.i_hash <= 877
;

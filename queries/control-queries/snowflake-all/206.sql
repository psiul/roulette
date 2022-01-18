select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,ship_mode sm,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 540 and cs.cs_hash <= 940 and i.i_hash >= 440 and i.i_hash <= 773 and sm.sm_hash >= 123 and sm.sm_hash <= 873
;

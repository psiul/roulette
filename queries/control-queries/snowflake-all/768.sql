select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,warehouse w,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 420 and cs.cs_hash <= 753 and d.d_hash >= 99 and d.d_hash <= 499 and sm.sm_hash >= 150 and sm.sm_hash <= 900
;

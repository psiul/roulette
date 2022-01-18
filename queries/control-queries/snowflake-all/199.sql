select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,item i,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 657 and cs.cs_hash <= 990 and i.i_hash >= 230 and i.i_hash <= 630 and d.d_hash >= 231 and d.d_hash <= 981
;

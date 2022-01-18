select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 224 and cs.cs_hash <= 974 and i.i_hash >= 493 and i.i_hash <= 826 and d.d_hash >= 308 and d.d_hash <= 708
;

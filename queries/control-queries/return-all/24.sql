select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,item i,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 52 and cs.cs_hash <= 802 and sm.sm_hash >= 230 and sm.sm_hash <= 630 and i.i_hash >= 134 and i.i_hash <= 467
;

select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,warehouse w,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 249 and cs.cs_hash <= 582 and sm.sm_hash >= 220 and sm.sm_hash <= 970 and d.d_hash >= 240 and d.d_hash <= 640
;

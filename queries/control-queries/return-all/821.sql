select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 298 and cs.cs_hash <= 631 and d.d_hash >= 94 and d.d_hash <= 844 and sm.sm_hash >= 90 and sm.sm_hash <= 490
;

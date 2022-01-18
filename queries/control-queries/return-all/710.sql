select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,warehouse w,date_dim d,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 24 and cs.cs_hash <= 424 and sm.sm_hash >= 616 and sm.sm_hash <= 949 and d.d_hash >= 44 and d.d_hash <= 794
;

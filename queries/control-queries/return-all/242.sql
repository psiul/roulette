select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,warehouse w,ship_mode sm,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 169 and cs.cs_hash <= 919 and sm.sm_hash >= 283 and sm.sm_hash <= 683 and d.d_hash >= 29 and d.d_hash <= 362
;

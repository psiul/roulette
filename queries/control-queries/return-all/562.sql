select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,ship_mode sm,date_dim d,warehouse w
where cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 337 and cs.cs_hash <= 737 and sm.sm_hash >= 484 and sm.sm_hash <= 817 and d.d_hash >= 5 and d.d_hash <= 755
;

select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,catalog_returns cr,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 62 and cs.cs_hash <= 462 and d.d_hash >= 212 and d.d_hash <= 962 and i.i_hash >= 37 and i.i_hash <= 370
;

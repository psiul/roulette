select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,catalog_returns cr,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 214 and cs.cs_hash <= 964 and i.i_hash >= 234 and i.i_hash <= 634 and d.d_hash >= 514 and d.d_hash <= 847
;

select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,warehouse w,date_dim d,item i
where cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 498 and cs.cs_hash <= 831 and d.d_hash >= 102 and d.d_hash <= 852 and i.i_hash >= 287 and i.i_hash <= 687
;

select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,warehouse w,catalog_returns cr
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 61 and cs.cs_hash <= 461 and i.i_hash >= 598 and i.i_hash <= 931 and d.d_hash >= 186 and d.d_hash <= 936
;

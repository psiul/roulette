select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,item i,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 471 and cs.cs_hash <= 871 and d.d_hash >= 29 and d.d_hash <= 779 and i.i_hash >= 109 and i.i_hash <= 442
;

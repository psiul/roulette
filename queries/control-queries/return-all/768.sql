select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,catalog_returns cr,item i,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 320 and cs.cs_hash <= 720 and i.i_hash >= 230 and i.i_hash <= 980 and d.d_hash >= 72 and d.d_hash <= 405
;

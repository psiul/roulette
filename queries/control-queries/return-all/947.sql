select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,item i,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 414 and cs.cs_hash <= 814 and d.d_hash >= 3 and d.d_hash <= 753 and i.i_hash >= 78 and i.i_hash <= 411
;

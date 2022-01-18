select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,catalog_returns cr
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 641 and cs.cs_hash <= 974 and d.d_hash >= 593 and d.d_hash <= 993 and i.i_hash >= 143 and i.i_hash <= 893
;

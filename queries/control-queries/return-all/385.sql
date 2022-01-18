select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,warehouse w,catalog_returns cr
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 191 and cs.cs_hash <= 591 and d.d_hash >= 418 and d.d_hash <= 751 and c.c_hash >= 23 and c.c_hash <= 773
;

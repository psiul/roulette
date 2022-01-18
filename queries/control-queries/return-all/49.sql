select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,catalog_returns cr,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 415 and cs.cs_hash <= 815 and c.c_hash >= 476 and c.c_hash <= 809 and d.d_hash >= 192 and d.d_hash <= 942
;

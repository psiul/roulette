select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,catalog_returns cr,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 224 and cs.cs_hash <= 974 and d.d_hash >= 216 and d.d_hash <= 549 and c.c_hash >= 267 and c.c_hash <= 667
;

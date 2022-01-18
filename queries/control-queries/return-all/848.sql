select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 662 and cs.cs_hash <= 995 and d.d_hash >= 103 and d.d_hash <= 503 and c.c_hash >= 121 and c.c_hash <= 871
;

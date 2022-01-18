select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer c,date_dim d,customer_address a
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 478 and c.c_hash <= 878 and d.d_hash >= 284 and d.d_hash <= 617 and a.ca_hash >= 158 and a.ca_hash <= 908
;

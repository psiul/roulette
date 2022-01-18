select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,customer c,customer_address a
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 173 and cs.cs_hash <= 506 and d.d_hash >= 23 and d.d_hash <= 773 and a.ca_hash >= 543 and a.ca_hash <= 943
;

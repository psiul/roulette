select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,catalog_returns cr,customer_address a
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 227 and cs.cs_hash <= 977 and d.d_hash >= 347 and d.d_hash <= 680 and a.ca_hash >= 409 and a.ca_hash <= 809
;

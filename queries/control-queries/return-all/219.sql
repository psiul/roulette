select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,catalog_returns cr,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 111 and cs.cs_hash <= 511 and c.c_hash >= 119 and c.c_hash <= 869 and d.d_hash >= 522 and d.d_hash <= 855
;

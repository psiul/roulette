select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,customer_address a
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 330 and cs.cs_hash <= 730 and d.d_hash >= 404 and d.d_hash <= 737 and i.i_hash >= 242 and i.i_hash <= 992
;

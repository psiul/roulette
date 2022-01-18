select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer c,customer_address a
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 356 and cs.cs_hash <= 756 and i.i_hash >= 486 and i.i_hash <= 819 and d.d_hash >= 168 and d.d_hash <= 918
;

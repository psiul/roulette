select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer c,customer_address a
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 174 and d.d_hash <= 924 and i.i_hash >= 355 and i.i_hash <= 688 and a.ca_hash >= 486 and a.ca_hash <= 886
;

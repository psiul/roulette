select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,date_dim d,customer_address a
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 290 and cs.cs_hash <= 690 and c.c_hash >= 225 and c.c_hash <= 975 and a.ca_hash >= 338 and a.ca_hash <= 671
;

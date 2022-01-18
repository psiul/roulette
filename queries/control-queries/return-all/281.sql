select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,date_dim d,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 145 and cs.cs_hash <= 545 and c.c_hash >= 33 and c.c_hash <= 366 and d.d_hash >= 182 and d.d_hash <= 932
;

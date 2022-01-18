select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_address a,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 184 and d.d_hash <= 584 and c.c_hash >= 92 and c.c_hash <= 842 and i.i_hash >= 153 and i.i_hash <= 486
;

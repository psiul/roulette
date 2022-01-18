select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 224 and c.c_hash <= 974 and i.i_hash >= 305 and i.i_hash <= 705 and a.ca_hash >= 616 and a.ca_hash <= 949
;

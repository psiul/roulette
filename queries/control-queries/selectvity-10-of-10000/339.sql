select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 172 and c.c_hash <= 372 and a.ca_hash >= 286 and a.ca_hash <= 386 and d.d_hash >= 1 and d.d_hash <= 51
;

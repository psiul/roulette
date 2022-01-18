select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 401 and ss.ss_hash <= 421 and d.d_hash >= 167 and d.d_hash <= 217 and i.i_hash >= 840 and i.i_hash <= 940
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 346 and d.d_hash <= 679 and i.i_hash >= 172 and i.i_hash <= 572 and a.ca_hash >= 136 and a.ca_hash <= 886
;

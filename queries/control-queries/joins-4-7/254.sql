select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 407 and ss.ss_hash <= 740 and a.ca_hash >= 373 and a.ca_hash <= 773 and d.d_hash >= 1 and d.d_hash <= 751
;

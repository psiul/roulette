select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 393 and ss.ss_hash <= 793 and d.d_hash >= 284 and d.d_hash <= 617 and a.ca_hash >= 42 and a.ca_hash <= 792
;

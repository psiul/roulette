select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 66 and d.d_hash <= 399 and c.c_hash >= 217 and c.c_hash <= 967 and a.ca_hash >= 280 and a.ca_hash <= 680
;

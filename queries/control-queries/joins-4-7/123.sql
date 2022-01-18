select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 268 and ss.ss_hash <= 601 and c.c_hash >= 153 and c.c_hash <= 903 and d.d_hash >= 99 and d.d_hash <= 499
;

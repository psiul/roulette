select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 662 and ss.ss_hash <= 995 and d.d_hash >= 94 and d.d_hash <= 494 and a.ca_hash >= 222 and a.ca_hash <= 972
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 582 and ss.ss_hash <= 982 and d.d_hash >= 26 and d.d_hash <= 776 and a.ca_hash >= 281 and a.ca_hash <= 614
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 570 and ss.ss_hash <= 970 and c.c_hash >= 136 and c.c_hash <= 886 and a.ca_hash >= 203 and a.ca_hash <= 536
;

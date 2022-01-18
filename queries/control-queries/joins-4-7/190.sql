select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 247 and ss.ss_hash <= 997 and c.c_hash >= 97 and c.c_hash <= 497 and a.ca_hash >= 9 and a.ca_hash <= 342
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 156 and ss.ss_hash <= 556 and c.c_hash >= 119 and c.c_hash <= 452 and a.ca_hash >= 223 and a.ca_hash <= 973
;

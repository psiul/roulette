select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 78 and ss.ss_hash <= 478 and c.c_hash >= 95 and c.c_hash <= 845 and a.ca_hash >= 229 and a.ca_hash <= 562
;

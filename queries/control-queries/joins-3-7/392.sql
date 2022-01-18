select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 479 and ss.ss_hash <= 812 and c.c_hash >= 28 and c.c_hash <= 778 and a.ca_hash >= 334 and a.ca_hash <= 734
;

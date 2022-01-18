select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 34 and ss.ss_hash <= 784 and c.c_hash >= 48 and c.c_hash <= 381 and a.ca_hash >= 105 and a.ca_hash <= 505
;

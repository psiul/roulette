select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 654 and ss.ss_hash <= 987 and c.c_hash >= 424 and c.c_hash <= 824 and a.ca_hash >= 232 and a.ca_hash <= 982
;

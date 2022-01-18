select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 532 and ss.ss_hash <= 865 and c.c_hash >= 391 and c.c_hash <= 791 and a.ca_hash >= 56 and a.ca_hash <= 806
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 60 and ss.ss_hash <= 810 and c.c_hash >= 389 and c.c_hash <= 722 and a.ca_hash >= 185 and a.ca_hash <= 585
;

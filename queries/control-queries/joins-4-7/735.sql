select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 586 and ss.ss_hash <= 986 and c.c_hash >= 139 and c.c_hash <= 889 and a.ca_hash >= 232 and a.ca_hash <= 565
;

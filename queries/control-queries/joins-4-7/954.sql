select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 46 and i.i_hash <= 796 and c.c_hash >= 513 and c.c_hash <= 913 and a.ca_hash >= 96 and a.ca_hash <= 429
;

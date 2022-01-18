select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 116 and ss.ss_hash <= 449 and c.c_hash >= 146 and c.c_hash <= 896 and a.ca_hash >= 105 and a.ca_hash <= 505
;

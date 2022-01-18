select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 169 and ss.ss_hash <= 502 and c.c_hash >= 386 and c.c_hash <= 786 and a.ca_hash >= 91 and a.ca_hash <= 841
;

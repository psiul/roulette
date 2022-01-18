select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 525 and ss.ss_hash <= 858 and i.i_hash >= 11 and i.i_hash <= 761 and c.c_hash >= 53 and c.c_hash <= 453
;

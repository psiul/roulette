select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 106 and i.i_hash <= 856 and c.c_hash >= 574 and c.c_hash <= 907 and a.ca_hash >= 471 and a.ca_hash <= 871
;

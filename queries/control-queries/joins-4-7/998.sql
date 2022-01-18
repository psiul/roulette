select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 215 and ss.ss_hash <= 548 and i.i_hash >= 181 and i.i_hash <= 581 and c.c_hash >= 63 and c.c_hash <= 813
;

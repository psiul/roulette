select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 530 and i.i_hash <= 930 and c.c_hash >= 101 and c.c_hash <= 851 and a.ca_hash >= 205 and a.ca_hash <= 538
;

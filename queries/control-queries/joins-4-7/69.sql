select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 648 and ss.ss_hash <= 981 and c.c_hash >= 148 and c.c_hash <= 898 and a.ca_hash >= 406 and a.ca_hash <= 806
;

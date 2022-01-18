select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 81 and ss.ss_hash <= 831 and c.c_hash >= 47 and c.c_hash <= 447 and i.i_hash >= 558 and i.i_hash <= 891
;

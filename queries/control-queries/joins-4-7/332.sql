select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 345 and c.c_hash <= 678 and a.ca_hash >= 510 and a.ca_hash <= 910 and i.i_hash >= 39 and i.i_hash <= 789
;

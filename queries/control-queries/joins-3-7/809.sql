select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 23 and ss.ss_hash <= 773 and i.i_hash >= 525 and i.i_hash <= 858 and c.c_hash >= 373 and c.c_hash <= 773
;

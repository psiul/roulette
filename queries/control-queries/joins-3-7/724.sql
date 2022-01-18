select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 64 and ss.ss_hash <= 397 and i.i_hash >= 46 and i.i_hash <= 796 and c.c_hash >= 29 and c.c_hash <= 429
;

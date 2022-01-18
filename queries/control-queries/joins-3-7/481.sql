select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 294 and ss.ss_hash <= 694 and i.i_hash >= 236 and i.i_hash <= 986 and c.c_hash >= 375 and c.c_hash <= 708
;

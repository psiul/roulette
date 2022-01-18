select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 32 and ss.ss_hash <= 782 and i.i_hash >= 199 and i.i_hash <= 532 and c.c_hash >= 374 and c.c_hash <= 774
;

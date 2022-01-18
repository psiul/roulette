select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 214 and ss.ss_hash <= 964 and i.i_hash >= 345 and i.i_hash <= 745 and c.c_hash >= 95 and c.c_hash <= 428
;

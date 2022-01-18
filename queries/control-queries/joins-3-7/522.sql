select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 458 and ss.ss_hash <= 858 and i.i_hash >= 217 and i.i_hash <= 550 and c.c_hash >= 249 and c.c_hash <= 999
;

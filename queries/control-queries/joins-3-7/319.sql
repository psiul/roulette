select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 406 and ss.ss_hash <= 806 and i.i_hash >= 117 and i.i_hash <= 867 and c.c_hash >= 561 and c.c_hash <= 894
;

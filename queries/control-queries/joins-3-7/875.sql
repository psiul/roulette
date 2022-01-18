select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 117 and ss.ss_hash <= 867 and i.i_hash >= 95 and i.i_hash <= 428 and c.c_hash >= 295 and c.c_hash <= 695
;

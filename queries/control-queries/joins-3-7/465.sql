select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 348 and ss.ss_hash <= 748 and i.i_hash >= 227 and i.i_hash <= 560 and c.c_hash >= 66 and c.c_hash <= 816
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 479 and ss.ss_hash <= 812 and i.i_hash >= 97 and i.i_hash <= 497 and c.c_hash >= 28 and c.c_hash <= 778
;

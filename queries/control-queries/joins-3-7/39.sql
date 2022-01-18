select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 18 and ss.ss_hash <= 768 and c.c_hash >= 90 and c.c_hash <= 490 and i.i_hash >= 377 and i.i_hash <= 710
;

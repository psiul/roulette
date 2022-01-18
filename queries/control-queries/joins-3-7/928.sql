select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 140 and ss.ss_hash <= 540 and i.i_hash >= 39 and i.i_hash <= 372 and c.c_hash >= 62 and c.c_hash <= 812
;

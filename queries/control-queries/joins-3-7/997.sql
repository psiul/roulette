select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 441 and ss.ss_hash <= 774 and i.i_hash >= 345 and i.i_hash <= 745 and c.c_hash >= 96 and c.c_hash <= 846
;

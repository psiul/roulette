select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 50 and ss.ss_hash <= 383 and i.i_hash >= 306 and i.i_hash <= 706 and c.c_hash >= 45 and c.c_hash <= 795
;

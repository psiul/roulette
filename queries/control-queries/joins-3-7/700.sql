select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 12 and ss.ss_hash <= 412 and i.i_hash >= 70 and i.i_hash <= 820 and c.c_hash >= 610 and c.c_hash <= 943
;

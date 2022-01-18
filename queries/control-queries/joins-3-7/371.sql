select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 361 and ss.ss_hash <= 694 and i.i_hash >= 183 and i.i_hash <= 933 and c.c_hash >= 548 and c.c_hash <= 948
;

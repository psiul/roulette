select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 469 and ss.ss_hash <= 869 and c.c_hash >= 194 and c.c_hash <= 944 and i.i_hash >= 101 and i.i_hash <= 434
;

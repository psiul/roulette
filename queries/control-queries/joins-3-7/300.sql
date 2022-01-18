select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 248 and ss.ss_hash <= 998 and c.c_hash >= 433 and c.c_hash <= 833 and i.i_hash >= 153 and i.i_hash <= 486
;

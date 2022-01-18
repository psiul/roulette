select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 232 and ss.ss_hash <= 565 and i.i_hash >= 130 and i.i_hash <= 880 and c.c_hash >= 290 and c.c_hash <= 690
;

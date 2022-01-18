select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 387 and ss.ss_hash <= 720 and i.i_hash >= 247 and i.i_hash <= 997 and c.c_hash >= 248 and c.c_hash <= 648
;

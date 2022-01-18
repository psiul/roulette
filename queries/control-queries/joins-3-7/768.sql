select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 44 and ss.ss_hash <= 794 and i.i_hash >= 269 and i.i_hash <= 602 and c.c_hash >= 281 and c.c_hash <= 681
;

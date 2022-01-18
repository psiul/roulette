select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 332 and ss.ss_hash <= 732 and i.i_hash >= 164 and i.i_hash <= 914 and c.c_hash >= 352 and c.c_hash <= 685
;

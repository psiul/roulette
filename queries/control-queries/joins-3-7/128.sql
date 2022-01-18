select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 164 and ss.ss_hash <= 914 and i.i_hash >= 353 and i.i_hash <= 686 and c.c_hash >= 344 and c.c_hash <= 744
;

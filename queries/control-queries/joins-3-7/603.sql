select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 71 and ss.ss_hash <= 821 and i.i_hash >= 642 and i.i_hash <= 975 and c.c_hash >= 324 and c.c_hash <= 724
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 598 and ss.ss_hash <= 931 and i.i_hash >= 219 and i.i_hash <= 969 and c.c_hash >= 117 and c.c_hash <= 517
;

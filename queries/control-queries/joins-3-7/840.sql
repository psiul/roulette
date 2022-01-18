select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 84 and ss.ss_hash <= 834 and i.i_hash >= 591 and i.i_hash <= 991 and c.c_hash >= 401 and c.c_hash <= 734
;

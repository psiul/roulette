select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 120 and ss.ss_hash <= 453 and i.i_hash >= 173 and i.i_hash <= 923 and c.c_hash >= 234 and c.c_hash <= 634
;

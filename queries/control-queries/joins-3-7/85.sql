select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 195 and ss.ss_hash <= 595 and i.i_hash >= 117 and i.i_hash <= 867 and c.c_hash >= 115 and c.c_hash <= 448
;

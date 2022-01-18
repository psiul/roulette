select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 288 and ss.ss_hash <= 621 and i.i_hash >= 13 and i.i_hash <= 763 and c.c_hash >= 124 and c.c_hash <= 524
;

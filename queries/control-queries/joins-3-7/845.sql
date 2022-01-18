select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 439 and ss.ss_hash <= 839 and c.c_hash >= 203 and c.c_hash <= 953 and i.i_hash >= 561 and i.i_hash <= 894
;

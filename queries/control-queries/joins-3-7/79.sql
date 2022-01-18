select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 497 and ss.ss_hash <= 830 and i.i_hash >= 40 and i.i_hash <= 790 and c.c_hash >= 351 and c.c_hash <= 751
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 19 and ss.ss_hash <= 352 and c.c_hash >= 390 and c.c_hash <= 790 and i.i_hash >= 224 and i.i_hash <= 974
;

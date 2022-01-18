select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 393 and ss.ss_hash <= 726 and c.c_hash >= 441 and c.c_hash <= 841 and i.i_hash >= 105 and i.i_hash <= 855
;

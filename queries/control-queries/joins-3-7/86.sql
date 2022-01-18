select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 642 and ss.ss_hash <= 975 and c.c_hash >= 466 and c.c_hash <= 866 and i.i_hash >= 116 and i.i_hash <= 866
;

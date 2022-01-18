select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 146 and ss.ss_hash <= 896 and c.c_hash >= 105 and c.c_hash <= 505 and i.i_hash >= 583 and i.i_hash <= 916
;

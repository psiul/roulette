select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 125 and ss.ss_hash <= 458 and c.c_hash >= 64 and c.c_hash <= 814 and i.i_hash >= 241 and i.i_hash <= 641
;

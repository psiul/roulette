select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 169 and ss.ss_hash <= 502 and c.c_hash >= 22 and c.c_hash <= 772 and i.i_hash >= 121 and i.i_hash <= 521
;

select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 331 and ss.ss_hash <= 831 and c.c_hash >= 84 and c.c_hash <= 284
;

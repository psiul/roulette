select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 303 and ss.ss_hash <= 803 and c.c_hash >= 550 and c.c_hash <= 750
;

select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 312 and ss.ss_hash <= 512 and c.c_hash >= 96 and c.c_hash <= 596
;

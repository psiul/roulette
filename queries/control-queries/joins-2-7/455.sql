select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 451 and ss.ss_hash <= 951 and c.c_hash >= 163 and c.c_hash <= 363
;

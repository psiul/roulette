select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 471 and ss.ss_hash <= 971 and c.c_hash >= 243 and c.c_hash <= 443
;

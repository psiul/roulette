select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 77 and ss.ss_hash <= 577 and c.c_hash >= 15 and c.c_hash <= 215
;

select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 712 and ss.ss_hash <= 912 and c.c_hash >= 285 and c.c_hash <= 785
;

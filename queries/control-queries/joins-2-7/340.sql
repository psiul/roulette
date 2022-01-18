select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 159 and ss.ss_hash <= 659 and c.c_hash >= 658 and c.c_hash <= 858
;

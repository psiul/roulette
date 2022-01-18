select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 718 and ss.ss_hash <= 918 and c.c_hash >= 210 and c.c_hash <= 710
;

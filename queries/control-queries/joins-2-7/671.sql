select count(ss.ss_item_sk)
from store_sales ss,customer c
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 160 and ss.ss_hash <= 660 and c.c_hash >= 708 and c.c_hash <= 908
;

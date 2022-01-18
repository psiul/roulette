select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 503 and ss.ss_hash <= 836 and i.i_hash >= 355 and i.i_hash <= 755 and c.c_hash >= 143 and c.c_hash <= 893
;

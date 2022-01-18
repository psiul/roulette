select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 566 and ss.ss_hash <= 966 and i.i_hash >= 78 and i.i_hash <= 828 and c.c_hash >= 658 and c.c_hash <= 991
;

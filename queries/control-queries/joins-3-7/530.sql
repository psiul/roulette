select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 5 and ss.ss_hash <= 755 and c.c_hash >= 113 and c.c_hash <= 446 and i.i_hash >= 375 and i.i_hash <= 775
;

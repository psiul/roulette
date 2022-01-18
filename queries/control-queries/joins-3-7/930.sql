select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 220 and ss.ss_hash <= 620 and i.i_hash >= 23 and i.i_hash <= 773 and c.c_hash >= 606 and c.c_hash <= 939
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 156 and ss.ss_hash <= 556 and i.i_hash >= 16 and i.i_hash <= 766 and c.c_hash >= 512 and c.c_hash <= 845
;

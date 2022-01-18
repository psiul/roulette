select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 492 and ss.ss_hash <= 892 and c.c_hash >= 84 and c.c_hash <= 834 and i.i_hash >= 556 and i.i_hash <= 889
;

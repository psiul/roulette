select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 66 and ss.ss_hash <= 816 and c.c_hash >= 318 and c.c_hash <= 651 and i.i_hash >= 584 and i.i_hash <= 984
;

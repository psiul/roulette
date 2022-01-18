select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 2 and ss.ss_hash <= 752 and c.c_hash >= 2 and c.c_hash <= 335 and i.i_hash >= 129 and i.i_hash <= 529
;

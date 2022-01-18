select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 187 and ss.ss_hash <= 587 and c.c_hash >= 172 and c.c_hash <= 922 and i.i_hash >= 117 and i.i_hash <= 450
;

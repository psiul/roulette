select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 176 and ss.ss_hash <= 926 and i.i_hash >= 425 and i.i_hash <= 758 and c.c_hash >= 397 and c.c_hash <= 797
;

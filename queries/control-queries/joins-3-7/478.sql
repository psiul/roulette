select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 537 and ss.ss_hash <= 937 and i.i_hash >= 639 and i.i_hash <= 972 and c.c_hash >= 22 and c.c_hash <= 772
;

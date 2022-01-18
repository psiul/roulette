select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 647 and ss.ss_hash <= 980 and i.i_hash >= 77 and i.i_hash <= 827 and c.c_hash >= 394 and c.c_hash <= 794
;

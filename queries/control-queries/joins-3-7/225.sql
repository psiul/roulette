select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 121 and ss.ss_hash <= 521 and i.i_hash >= 137 and i.i_hash <= 887 and c.c_hash >= 132 and c.c_hash <= 465
;

select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 265 and ss.ss_hash <= 598 and i.i_hash >= 190 and i.i_hash <= 590 and c.c_hash >= 232 and c.c_hash <= 982
;

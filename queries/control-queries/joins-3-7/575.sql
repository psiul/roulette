select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 351 and ss.ss_hash <= 684 and i.i_hash >= 317 and i.i_hash <= 717 and c.c_hash >= 197 and c.c_hash <= 947
;

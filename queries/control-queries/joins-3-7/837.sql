select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 417 and ss.ss_hash <= 817 and i.i_hash >= 31 and i.i_hash <= 364 and c.c_hash >= 101 and c.c_hash <= 851
;

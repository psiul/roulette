select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 456 and ss.ss_hash <= 856 and i.i_hash >= 151 and i.i_hash <= 901 and c.c_hash >= 522 and c.c_hash <= 855
;

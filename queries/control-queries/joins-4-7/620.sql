select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 399 and ss.ss_hash <= 732 and d.d_hash >= 17 and d.d_hash <= 767 and i.i_hash >= 36 and i.i_hash <= 436
;

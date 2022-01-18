select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 5 and d.d_hash <= 405 and c.c_hash >= 592 and c.c_hash <= 925 and i.i_hash >= 231 and i.i_hash <= 981
;

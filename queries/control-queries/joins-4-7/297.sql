select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 100 and ss.ss_hash <= 500 and i.i_hash >= 214 and i.i_hash <= 964 and c.c_hash >= 375 and c.c_hash <= 708
;

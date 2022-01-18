select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 435 and i.i_hash <= 768 and d.d_hash >= 213 and d.d_hash <= 963 and c.c_hash >= 89 and c.c_hash <= 489
;

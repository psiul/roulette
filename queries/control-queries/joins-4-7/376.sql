select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 423 and ss.ss_hash <= 823 and d.d_hash >= 459 and d.d_hash <= 792 and c.c_hash >= 122 and c.c_hash <= 872
;

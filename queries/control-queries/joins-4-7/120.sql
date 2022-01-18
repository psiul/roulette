select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 305 and ss.ss_hash <= 705 and c.c_hash >= 546 and c.c_hash <= 879 and d.d_hash >= 4 and d.d_hash <= 754
;

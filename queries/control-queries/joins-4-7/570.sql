select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 158 and ss.ss_hash <= 908 and d.d_hash >= 407 and d.d_hash <= 740 and c.c_hash >= 310 and c.c_hash <= 710
;

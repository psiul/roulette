select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 90 and i.i_hash <= 840 and d.d_hash >= 327 and d.d_hash <= 727 and c.c_hash >= 604 and c.c_hash <= 937
;

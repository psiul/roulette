select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 25 and ss.ss_hash <= 358 and i.i_hash >= 327 and i.i_hash <= 727 and d.d_hash >= 65 and d.d_hash <= 815
;

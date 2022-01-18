select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 85 and c.c_hash <= 835 and i.i_hash >= 436 and i.i_hash <= 836 and d.d_hash >= 316 and d.d_hash <= 649
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 91 and ss.ss_hash <= 491 and c.c_hash >= 14 and c.c_hash <= 347 and d.d_hash >= 196 and d.d_hash <= 946
;

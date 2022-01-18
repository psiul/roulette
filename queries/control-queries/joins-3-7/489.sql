select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 542 and ss.ss_hash <= 942 and d.d_hash >= 371 and d.d_hash <= 704 and c.c_hash >= 213 and c.c_hash <= 963
;

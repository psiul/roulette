select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 537 and ss.ss_hash <= 870 and d.d_hash >= 521 and d.d_hash <= 921 and c.c_hash >= 119 and c.c_hash <= 869
;

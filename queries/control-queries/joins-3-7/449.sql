select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 215 and ss.ss_hash <= 615 and d.d_hash >= 3 and d.d_hash <= 753 and c.c_hash >= 475 and c.c_hash <= 808
;

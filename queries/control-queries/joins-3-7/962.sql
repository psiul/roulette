select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 167 and ss.ss_hash <= 917 and d.d_hash >= 23 and d.d_hash <= 356 and c.c_hash >= 395 and c.c_hash <= 795
;

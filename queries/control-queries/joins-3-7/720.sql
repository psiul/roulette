select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 235 and ss.ss_hash <= 635 and d.d_hash >= 79 and d.d_hash <= 412 and c.c_hash >= 25 and c.c_hash <= 775
;

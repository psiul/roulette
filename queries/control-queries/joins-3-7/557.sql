select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 21 and ss.ss_hash <= 421 and c.c_hash >= 4 and c.c_hash <= 754 and d.d_hash >= 652 and d.d_hash <= 985
;

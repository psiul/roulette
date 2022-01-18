select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 51 and ss.ss_hash <= 801 and d.d_hash >= 365 and d.d_hash <= 698 and c.c_hash >= 77 and c.c_hash <= 477
;

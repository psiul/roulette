select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 48 and ss.ss_hash <= 798 and d.d_hash >= 23 and d.d_hash <= 423 and c.c_hash >= 275 and c.c_hash <= 608
;

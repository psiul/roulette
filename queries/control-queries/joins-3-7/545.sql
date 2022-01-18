select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 66 and ss.ss_hash <= 816 and c.c_hash >= 548 and c.c_hash <= 948 and d.d_hash >= 322 and d.d_hash <= 655
;

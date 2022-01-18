select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 593 and ss.ss_hash <= 993 and c.c_hash >= 171 and c.c_hash <= 921 and d.d_hash >= 413 and d.d_hash <= 746
;

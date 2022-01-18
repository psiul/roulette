select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 190 and ss.ss_hash <= 590 and d.d_hash >= 147 and d.d_hash <= 897 and c.c_hash >= 535 and c.c_hash <= 868
;

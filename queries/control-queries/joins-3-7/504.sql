select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 493 and ss.ss_hash <= 893 and d.d_hash >= 65 and d.d_hash <= 398 and c.c_hash >= 212 and c.c_hash <= 962
;

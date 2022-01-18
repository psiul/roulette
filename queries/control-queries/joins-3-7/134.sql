select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 619 and ss.ss_hash <= 952 and d.d_hash >= 87 and d.d_hash <= 487 and c.c_hash >= 147 and c.c_hash <= 897
;

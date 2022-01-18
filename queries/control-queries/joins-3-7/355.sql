select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 355 and ss.ss_hash <= 688 and d.d_hash >= 262 and d.d_hash <= 662 and c.c_hash >= 64 and c.c_hash <= 814
;

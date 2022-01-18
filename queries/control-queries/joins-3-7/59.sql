select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 151 and ss.ss_hash <= 901 and d.d_hash >= 217 and d.d_hash <= 550 and c.c_hash >= 368 and c.c_hash <= 768
;

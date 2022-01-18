select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 494 and ss.ss_hash <= 894 and c.c_hash >= 1 and c.c_hash <= 751 and d.d_hash >= 586 and d.d_hash <= 919
;

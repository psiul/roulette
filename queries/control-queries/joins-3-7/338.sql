select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 176 and ss.ss_hash <= 926 and c.c_hash >= 385 and c.c_hash <= 785 and d.d_hash >= 616 and d.d_hash <= 949
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 143 and ss.ss_hash <= 893 and d.d_hash >= 331 and d.d_hash <= 664 and c.c_hash >= 526 and c.c_hash <= 926
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 440 and ss.ss_hash <= 840 and d.d_hash >= 105 and d.d_hash <= 855 and c.c_hash >= 234 and c.c_hash <= 567
;

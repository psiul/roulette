select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 133 and ss.ss_hash <= 533 and d.d_hash >= 338 and d.d_hash <= 671 and i.i_hash >= 119 and i.i_hash <= 869
;

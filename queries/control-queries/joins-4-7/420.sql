select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 122 and ss.ss_hash <= 872 and d.d_hash >= 363 and d.d_hash <= 763 and i.i_hash >= 188 and i.i_hash <= 521
;

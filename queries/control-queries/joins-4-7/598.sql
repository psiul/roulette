select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 462 and ss.ss_hash <= 795 and d.d_hash >= 220 and d.d_hash <= 970 and i.i_hash >= 207 and i.i_hash <= 607
;

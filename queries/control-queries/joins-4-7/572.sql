select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 281 and ss.ss_hash <= 614 and c.c_hash >= 2 and c.c_hash <= 402 and i.i_hash >= 210 and i.i_hash <= 960
;

select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 654 and i.i_hash <= 987 and d.d_hash >= 377 and d.d_hash <= 777 and c.c_hash >= 123 and c.c_hash <= 873
;

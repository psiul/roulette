select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 383 and ss.ss_hash <= 716 and d.d_hash >= 113 and d.d_hash <= 513 and c.c_hash >= 124 and c.c_hash <= 874
;

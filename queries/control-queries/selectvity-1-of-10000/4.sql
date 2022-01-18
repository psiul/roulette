select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 327 and ss.ss_hash <= 377 and d.d_hash >= 830 and d.d_hash <= 850 and c.c_hash >= 551 and c.c_hash <= 651
;

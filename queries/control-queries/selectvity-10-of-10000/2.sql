select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 542 and ss.ss_hash <= 592 and i.i_hash >= 302 and i.i_hash <= 502 and d.d_hash >= 264 and d.d_hash <= 364
;

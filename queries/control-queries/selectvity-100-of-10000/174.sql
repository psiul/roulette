select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 42 and ss.ss_hash <= 542 and d.d_hash >= 707 and d.d_hash <= 907 and i.i_hash >= 466 and i.i_hash <= 566
;

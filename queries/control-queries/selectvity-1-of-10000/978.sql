select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 573 and ss.ss_hash <= 593 and d.d_hash >= 398 and d.d_hash <= 448 and hd.hd_hash >= 381 and hd.hd_hash <= 481
;

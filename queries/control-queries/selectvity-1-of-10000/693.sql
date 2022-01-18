select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 643 and ss.ss_hash <= 693 and hd.hd_hash >= 652 and hd.hd_hash <= 672 and i.i_hash >= 354 and i.i_hash <= 454
;

select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 750 and ss.ss_hash <= 800 and d.d_hash >= 464 and d.d_hash <= 664 and c.c_hash >= 468 and c.c_hash <= 568
;

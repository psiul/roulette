select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 413 and ss.ss_hash <= 746 and c.c_hash >= 230 and c.c_hash <= 980 and d.d_hash >= 483 and d.d_hash <= 883
;

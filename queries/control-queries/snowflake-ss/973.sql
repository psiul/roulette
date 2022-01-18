select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 162 and d.d_hash <= 562 and c.c_hash >= 7 and c.c_hash <= 340 and hd.hd_hash >= 41 and hd.hd_hash <= 791
;

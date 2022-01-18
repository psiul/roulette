select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 393 and d.d_hash <= 593 and c.c_hash >= 271 and c.c_hash <= 371 and hd.hd_hash >= 82 and hd.hd_hash <= 132
;

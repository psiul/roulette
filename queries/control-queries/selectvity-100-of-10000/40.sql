select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 69 and ss.ss_hash <= 269 and hd.hd_hash >= 419 and hd.hd_hash <= 919 and i.i_hash >= 436 and i.i_hash <= 536
;

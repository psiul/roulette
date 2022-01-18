select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 566 and ss.ss_hash <= 899 and d.d_hash >= 54 and d.d_hash <= 804 and hd.hd_hash >= 465 and hd.hd_hash <= 865
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 37 and c.c_hash <= 370 and d.d_hash >= 7 and d.d_hash <= 407 and hd.hd_hash >= 151 and hd.hd_hash <= 901
;

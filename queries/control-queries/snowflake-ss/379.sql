select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 137 and d.d_hash <= 887 and c.c_hash >= 9 and c.c_hash <= 342 and hd.hd_hash >= 415 and hd.hd_hash <= 815
;

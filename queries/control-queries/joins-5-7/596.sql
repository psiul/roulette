select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 238 and ss.ss_hash <= 988 and d.d_hash >= 92 and d.d_hash <= 492 and hd.hd_hash >= 241 and hd.hd_hash <= 574
;

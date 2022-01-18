select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 294 and ss.ss_hash <= 694 and hd.hd_hash >= 487 and hd.hd_hash <= 820 and d.d_hash >= 231 and d.d_hash <= 981
;

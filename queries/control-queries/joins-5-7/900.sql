select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 66 and i.i_hash <= 816 and d.d_hash >= 31 and d.d_hash <= 431 and hd.hd_hash >= 421 and hd.hd_hash <= 754
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 22 and hd.hd_hash <= 772 and i.i_hash >= 497 and i.i_hash <= 830 and d.d_hash >= 554 and d.d_hash <= 954
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 37 and d.d_hash <= 437 and hd.hd_hash >= 497 and hd.hd_hash <= 830 and i.i_hash >= 145 and i.i_hash <= 895
;

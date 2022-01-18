select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 275 and hd.hd_hash <= 775 and d.d_hash >= 93 and d.d_hash <= 293 and i.i_hash >= 391 and i.i_hash <= 491
;

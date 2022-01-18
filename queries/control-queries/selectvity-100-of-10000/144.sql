select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 731 and ss.ss_hash <= 931 and d.d_hash >= 319 and d.d_hash <= 419 and hd.hd_hash >= 458 and hd.hd_hash <= 958
;

select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 27 and ss.ss_hash <= 360 and hd.hd_hash >= 457 and hd.hd_hash <= 857 and d.d_hash >= 40 and d.d_hash <= 790
;

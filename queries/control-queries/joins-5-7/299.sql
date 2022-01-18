select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 38 and ss.ss_hash <= 788 and i.i_hash >= 440 and i.i_hash <= 840 and d.d_hash >= 346 and d.d_hash <= 679
;

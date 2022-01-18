select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 108 and ss.ss_hash <= 441 and i.i_hash >= 432 and i.i_hash <= 832 and c.c_hash >= 240 and c.c_hash <= 990
;

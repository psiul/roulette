select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 132 and d.d_hash <= 332 and i.i_hash >= 190 and i.i_hash <= 290 and hd.hd_hash >= 257 and hd.hd_hash <= 307
;

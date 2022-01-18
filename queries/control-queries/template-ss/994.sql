select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 247 and ss.ss_hash <= 997 and d.d_hash >= 467 and d.d_hash <= 800 and i.i_hash >= 210 and i.i_hash <= 610
;

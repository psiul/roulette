select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 77 and ss.ss_hash <= 827 and i.i_hash >= 29 and i.i_hash <= 429 and d.d_hash >= 553 and d.d_hash <= 886
;

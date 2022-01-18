select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 509 and ss.ss_hash <= 559 and i.i_hash >= 669 and i.i_hash <= 769 and d.d_hash >= 686 and d.d_hash <= 886
;

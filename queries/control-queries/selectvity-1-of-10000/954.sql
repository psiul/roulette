select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 686 and ss.ss_hash <= 706 and i.i_hash >= 858 and i.i_hash <= 908 and c.c_hash >= 359 and c.c_hash <= 459
;

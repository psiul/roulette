select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 422 and ss.ss_hash <= 822 and i.i_hash >= 242 and i.i_hash <= 992 and d.d_hash >= 160 and d.d_hash <= 493
;

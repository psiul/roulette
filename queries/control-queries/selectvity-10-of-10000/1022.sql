select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 407 and ss.ss_hash <= 507 and hd.hd_hash >= 498 and hd.hd_hash <= 548 and d.d_hash >= 316 and d.d_hash <= 516
;

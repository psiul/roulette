select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 13 and ss.ss_hash <= 763 and i.i_hash >= 341 and i.i_hash <= 741 and d.d_hash >= 623 and d.d_hash <= 956
;

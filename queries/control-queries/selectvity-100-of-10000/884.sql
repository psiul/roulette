select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 366 and hd.hd_hash <= 566 and d.d_hash >= 705 and d.d_hash <= 805 and i.i_hash >= 59 and i.i_hash <= 559
;

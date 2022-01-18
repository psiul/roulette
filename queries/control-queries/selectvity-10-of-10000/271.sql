select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 64 and ss.ss_hash <= 264 and hd.hd_hash >= 101 and hd.hd_hash <= 201 and i.i_hash >= 418 and i.i_hash <= 468
;

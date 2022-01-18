select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 651 and ss.ss_hash <= 701 and d.d_hash >= 53 and d.d_hash <= 153 and i.i_hash >= 180 and i.i_hash <= 200
;

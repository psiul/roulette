select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 200 and ss.ss_hash <= 250 and hd.hd_hash >= 260 and hd.hd_hash <= 360 and d.d_hash >= 40 and d.d_hash <= 60
;

select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 230 and ss.ss_hash <= 330 and i.i_hash >= 281 and i.i_hash <= 301 and hd.hd_hash >= 911 and hd.hd_hash <= 961
;

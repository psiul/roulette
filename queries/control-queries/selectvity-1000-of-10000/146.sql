select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 265 and ss.ss_hash <= 665 and d.d_hash >= 164 and d.d_hash <= 914 and hd.hd_hash >= 420 and hd.hd_hash <= 753
;

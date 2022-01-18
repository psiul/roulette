select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 117 and c.c_hash <= 867 and d.d_hash >= 385 and d.d_hash <= 718 and hd.hd_hash >= 82 and hd.hd_hash <= 482
;

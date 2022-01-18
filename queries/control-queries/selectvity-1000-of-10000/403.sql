select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 145 and ss.ss_hash <= 895 and d.d_hash >= 526 and d.d_hash <= 926 and hd.hd_hash >= 326 and hd.hd_hash <= 659
;

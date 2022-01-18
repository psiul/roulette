select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 357 and ss.ss_hash <= 757 and d.d_hash >= 545 and d.d_hash <= 878 and hd.hd_hash >= 69 and hd.hd_hash <= 819
;

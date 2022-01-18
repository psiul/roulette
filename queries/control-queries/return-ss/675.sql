select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 650 and ss.ss_hash <= 983 and d.d_hash >= 217 and d.d_hash <= 967 and i.i_hash >= 119 and i.i_hash <= 519
;

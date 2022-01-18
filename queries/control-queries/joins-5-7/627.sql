select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 88 and ss.ss_hash <= 838 and c.c_hash >= 528 and c.c_hash <= 928 and d.d_hash >= 504 and d.d_hash <= 837
;

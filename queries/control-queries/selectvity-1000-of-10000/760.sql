select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 524 and ss.ss_hash <= 857 and d.d_hash >= 430 and d.d_hash <= 830 and c.c_hash >= 139 and c.c_hash <= 889
;

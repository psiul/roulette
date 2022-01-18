select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 62 and i.i_hash <= 262 and hd.hd_hash >= 249 and hd.hd_hash <= 349 and c.c_hash >= 844 and c.c_hash <= 894
;

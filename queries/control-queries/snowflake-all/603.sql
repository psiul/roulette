select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 472 and d.d_hash <= 872 and c.c_hash >= 327 and c.c_hash <= 660 and hd.hd_hash >= 215 and hd.hd_hash <= 965
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 467 and d.d_hash <= 867 and c.c_hash >= 114 and c.c_hash <= 864 and hd.hd_hash >= 172 and hd.hd_hash <= 505
;

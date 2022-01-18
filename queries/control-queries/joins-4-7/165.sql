select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 500 and ss.ss_hash <= 833 and d.d_hash >= 29 and d.d_hash <= 779 and hd.hd_hash >= 57 and hd.hd_hash <= 457
;

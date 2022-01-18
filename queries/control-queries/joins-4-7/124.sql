select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 8 and hd.hd_hash <= 408 and d.d_hash >= 138 and d.d_hash <= 888 and c.c_hash >= 353 and c.c_hash <= 686
;

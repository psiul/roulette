select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 54 and ss.ss_hash <= 387 and d.d_hash >= 116 and d.d_hash <= 516 and hd.hd_hash >= 48 and hd.hd_hash <= 798
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 402 and hd.hd_hash <= 735 and d.d_hash >= 121 and d.d_hash <= 871 and c.c_hash >= 430 and c.c_hash <= 830
;

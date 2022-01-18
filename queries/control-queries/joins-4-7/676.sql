select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 469 and ss.ss_hash <= 869 and hd.hd_hash >= 239 and hd.hd_hash <= 989 and d.d_hash >= 88 and d.d_hash <= 421
;

select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 354 and ss.ss_hash <= 754 and hd.hd_hash >= 630 and hd.hd_hash <= 963 and c.c_hash >= 24 and c.c_hash <= 774
;

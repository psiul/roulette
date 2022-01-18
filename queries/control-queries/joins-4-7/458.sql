select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 74 and ss.ss_hash <= 824 and hd.hd_hash >= 21 and hd.hd_hash <= 354 and c.c_hash >= 115 and c.c_hash <= 515
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 51 and d.d_hash <= 451 and hd.hd_hash >= 192 and hd.hd_hash <= 942 and c.c_hash >= 287 and c.c_hash <= 620
;

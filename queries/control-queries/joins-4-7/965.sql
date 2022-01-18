select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and c.c_hash >= 57 and c.c_hash <= 390 and hd.hd_hash >= 122 and hd.hd_hash <= 522
;

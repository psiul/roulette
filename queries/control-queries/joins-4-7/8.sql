select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 80 and ss.ss_hash <= 413 and hd.hd_hash >= 333 and hd.hd_hash <= 733 and c.c_hash >= 8 and c.c_hash <= 758
;

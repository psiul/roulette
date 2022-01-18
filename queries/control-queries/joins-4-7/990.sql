select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 655 and ss.ss_hash <= 988 and c.c_hash >= 18 and c.c_hash <= 418 and d.d_hash >= 32 and d.d_hash <= 782
;

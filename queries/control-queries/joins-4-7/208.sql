select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 114 and ss.ss_hash <= 864 and c.c_hash >= 255 and c.c_hash <= 655 and d.d_hash >= 617 and d.d_hash <= 950
;

select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 10 and ss.ss_hash <= 410 and c.c_hash >= 649 and c.c_hash <= 982 and hd.hd_hash >= 122 and hd.hd_hash <= 872
;

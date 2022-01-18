select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 223 and ss.ss_hash <= 973 and d.d_hash >= 439 and d.d_hash <= 772 and hd.hd_hash >= 514 and hd.hd_hash <= 914
;

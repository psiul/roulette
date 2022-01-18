select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 233 and ss.ss_hash <= 566 and c.c_hash >= 149 and c.c_hash <= 549 and hd.hd_hash >= 121 and hd.hd_hash <= 871
;

select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 549 and ss.ss_hash <= 949 and c.c_hash >= 56 and c.c_hash <= 806 and hd.hd_hash >= 476 and hd.hd_hash <= 809
;

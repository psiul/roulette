select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 38 and c.c_hash <= 438 and d.d_hash >= 8 and d.d_hash <= 758 and hd.hd_hash >= 175 and hd.hd_hash <= 508
;

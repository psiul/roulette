select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 188 and ss.ss_hash <= 938 and d.d_hash >= 453 and d.d_hash <= 786 and hd.hd_hash >= 542 and hd.hd_hash <= 942
;

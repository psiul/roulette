select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 46 and ss.ss_hash <= 379 and hd.hd_hash >= 219 and hd.hd_hash <= 969 and c.c_hash >= 19 and c.c_hash <= 419
;

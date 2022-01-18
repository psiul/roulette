select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 22 and ss.ss_hash <= 772 and hd.hd_hash >= 500 and hd.hd_hash <= 900 and c.c_hash >= 163 and c.c_hash <= 496
;

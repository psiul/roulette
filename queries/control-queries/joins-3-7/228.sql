select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 32 and ss.ss_hash <= 782 and hd.hd_hash >= 220 and hd.hd_hash <= 553 and c.c_hash >= 314 and c.c_hash <= 714
;

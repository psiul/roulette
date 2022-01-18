select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 32 and ss.ss_hash <= 782 and c.c_hash >= 63 and c.c_hash <= 396 and hd.hd_hash >= 465 and hd.hd_hash <= 865
;

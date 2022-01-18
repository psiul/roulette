select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 57 and ss.ss_hash <= 457 and c.c_hash >= 64 and c.c_hash <= 814 and hd.hd_hash >= 126 and hd.hd_hash <= 459
;

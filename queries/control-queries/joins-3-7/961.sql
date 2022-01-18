select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 595 and ss.ss_hash <= 928 and c.c_hash >= 53 and c.c_hash <= 803 and hd.hd_hash >= 294 and hd.hd_hash <= 694
;

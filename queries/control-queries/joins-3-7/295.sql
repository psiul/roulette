select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 160 and ss.ss_hash <= 910 and hd.hd_hash >= 250 and hd.hd_hash <= 650 and c.c_hash >= 334 and c.c_hash <= 667
;

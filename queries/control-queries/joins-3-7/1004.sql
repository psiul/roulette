select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 39 and ss.ss_hash <= 789 and hd.hd_hash >= 349 and hd.hd_hash <= 749 and c.c_hash >= 503 and c.c_hash <= 836
;

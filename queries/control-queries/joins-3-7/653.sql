select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 559 and ss.ss_hash <= 892 and c.c_hash >= 0 and c.c_hash <= 750 and hd.hd_hash >= 378 and hd.hd_hash <= 778
;

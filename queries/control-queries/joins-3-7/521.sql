select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 61 and ss.ss_hash <= 461 and c.c_hash >= 82 and c.c_hash <= 832 and hd.hd_hash >= 349 and hd.hd_hash <= 682
;

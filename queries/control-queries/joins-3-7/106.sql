select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 539 and ss.ss_hash <= 939 and c.c_hash >= 42 and c.c_hash <= 792 and hd.hd_hash >= 402 and hd.hd_hash <= 735
;

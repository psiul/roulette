select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 71 and ss.ss_hash <= 821 and hd.hd_hash >= 69 and hd.hd_hash <= 402 and c.c_hash >= 333 and c.c_hash <= 733
;

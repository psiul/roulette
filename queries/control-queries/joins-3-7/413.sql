select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 116 and ss.ss_hash <= 449 and hd.hd_hash >= 486 and hd.hd_hash <= 886 and c.c_hash >= 205 and c.c_hash <= 955
;

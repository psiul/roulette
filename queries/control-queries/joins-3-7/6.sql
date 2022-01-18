select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 336 and ss.ss_hash <= 669 and hd.hd_hash >= 142 and hd.hd_hash <= 542 and c.c_hash >= 211 and c.c_hash <= 961
;

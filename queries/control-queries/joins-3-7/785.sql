select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 446 and ss.ss_hash <= 779 and hd.hd_hash >= 57 and hd.hd_hash <= 807 and c.c_hash >= 454 and c.c_hash <= 854
;

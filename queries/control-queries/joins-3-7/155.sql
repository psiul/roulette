select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 278 and ss.ss_hash <= 678 and hd.hd_hash >= 2 and hd.hd_hash <= 752 and c.c_hash >= 386 and c.c_hash <= 719
;

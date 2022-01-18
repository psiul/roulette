select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 447 and ss.ss_hash <= 847 and hd.hd_hash >= 598 and hd.hd_hash <= 931 and c.c_hash >= 90 and c.c_hash <= 840
;

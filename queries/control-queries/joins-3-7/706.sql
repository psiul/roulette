select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 195 and ss.ss_hash <= 945 and c.c_hash >= 80 and c.c_hash <= 480 and hd.hd_hash >= 379 and hd.hd_hash <= 712
;

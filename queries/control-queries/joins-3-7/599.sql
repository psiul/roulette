select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 206 and ss.ss_hash <= 956 and c.c_hash >= 143 and c.c_hash <= 543 and hd.hd_hash >= 166 and hd.hd_hash <= 499
;

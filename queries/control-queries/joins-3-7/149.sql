select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 34 and ss.ss_hash <= 784 and hd.hd_hash >= 186 and hd.hd_hash <= 519 and c.c_hash >= 397 and c.c_hash <= 797
;

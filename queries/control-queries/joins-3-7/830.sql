select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 191 and ss.ss_hash <= 941 and hd.hd_hash >= 103 and hd.hd_hash <= 503 and c.c_hash >= 546 and c.c_hash <= 879
;

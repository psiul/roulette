select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 116 and ss.ss_hash <= 449 and c.c_hash >= 216 and c.c_hash <= 966 and hd.hd_hash >= 229 and hd.hd_hash <= 629
;

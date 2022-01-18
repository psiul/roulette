select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 523 and ss.ss_hash <= 923 and c.c_hash >= 68 and c.c_hash <= 818 and hd.hd_hash >= 362 and hd.hd_hash <= 695
;
